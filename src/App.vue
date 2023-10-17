<template>
  <div id="app">
    <div class="container">
      <div class="left-container">
        <SearchBox @selected-state="handleSelectedState" />
      </div>
      <div class="right-container">
        <GoogleMap :selectedState="selectedState" />
      </div>
    </div>
  </div>
</template>

<style>
.container {
  display: flex;
  justify-content: space-between;
  padding: 20px; /* 你可以根据需要调整容器的内边距 */
}

.left-container {
  flex: 1; /* 左侧容器占据页面的一半宽度 */
  padding-right: 10px; /* 可选的右内边距，用于分隔左右容器 */
  /* 你可以添加其他样式，例如背景颜色或边框 */
}

.right-container {
  flex: 1; /* 右侧容器占据页面的一半宽度 */
  padding-left: 10px; /* 可选的左内边距，用于分隔左右容器 */
  /* 你可以添加其他样式，例如背景颜色或边框 */
}
</style>

<script>
import SearchBox from "@/components/SearchBox.vue";
import GoogleMap from "@/components/GoogleMap.vue"; // 导入 GoogleMap 组件
import { ref } from 'vue';

export default {
  setup() {
    const selectedState = ref("");

    function handleSelectedState(stateName) {
      selectedState.value = stateName; // 接收来自子组件的数据
    }

    return {
      selectedState,
      handleSelectedState,
    };
  },
  name: "App",
  components: {
    SearchBox,
    GoogleMap, // 注册 GoogleMap 组件
  },
};
</script>
