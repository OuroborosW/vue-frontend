import { createApp } from 'vue';
import App from './App.vue';
import { ApolloClient, InMemoryCache } from '@apollo/client/core';
import { provideApolloClient } from "@vue/apollo-composable";

const apolloClient = new ApolloClient({
    uri: 'http://localhost:8080/graphql',
    cache: new InMemoryCache(),
});

const app = createApp(App);

// 使用 provideApolloClient 函数确保 Apollo Client 可以在你的 Vue 应用中使用
provideApolloClient(apolloClient);

app.mount('#app');
