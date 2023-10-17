<template>
  <div>
    <input v-model="searchText" @input="search" @focus="showDropdown = true" @blur="showDropdown = true" />
    <ul v-if="showDropdown" class="dropdown">
      <li v-for="state in searchResults" :key="state.name" @click="selectState(state.name)">
        {{ state.name }}
      </li>
    </ul>
  </div>
</template>

<script>
import { ref} from 'vue';
import axios from 'axios';


export default {
  name: "SearchBox",
  setup(_, { emit }) {
    const searchText = ref("");
    const searchResults = ref([]);
    const showDropdown = ref(false);

    function search() {
      const query = `
        query {
          search(input: "${searchText.value}") {
            name
          }
        }
      `;

      axios.post('http://localhost:8080/graphql', { query })
          .then(response => {
            searchResults.value = response.data.data.search;
          })
          .catch(error => {
            console.error(error);
          });
    }

    function selectState(stateName) {
      searchText.value = stateName; // 绑定 searchText 到输入框
      showDropdown.value = false;
      emit('selectedState', stateName);
    }

    return {
      searchText,
      searchResults,
      showDropdown,
      search,
      selectState
    };
  },
};
</script>

<style>
.dropdown {
  list-style-type: none;
  border: 1px solid #ccc;
  padding: 0;
  margin: 0;
  max-height: 150px;
  overflow-y: auto;
  max-width: 200px;
}

.dropdown li {
  padding: 8px;
  cursor: pointer;
}

.dropdown li:hover {
  background-color: #f2f2f2;
}
</style>
