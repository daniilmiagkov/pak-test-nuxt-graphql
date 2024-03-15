<template>
  <TableRecordsSurgeries/>
</template>

<script setup lang="ts">
/*
import { ref } from "@vue/reactivity";
import {onMounted} from "@vue/runtime-core";

const url = 'http://localhost:8080/graphql'; // Замените на адрес вашего GraphQL-сервера
const author = ref({}); // Инициализация реактивной переменной

const query = `
  query {
    bookById(id: "book-1") {
      author {
        id
      }
    }
  }
`;

onMounted(() => {
  fetch(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ query })
  })
      .then(response => response.json())
      .then(data => {
        author.value = data.data.bookById.author.id; // Установка значения author
        console.log('Data received:', data);
        // Обрабатывайте полученные данные здесь
      })
      .catch(error => console.error('Error:', error))

})
*/

</script>

<style scoped lang="scss">

</style>
