<template>
  <div>

  </div>
</template>

<script setup lang="ts">
const url = 'http://localhost:8080/graphql'; // Замените на адрес вашего GraphQL-сервера

const query = `
  query {
  bookById(id: "book-1") {
    author {
      id
    }
  }
}
`;


fetch(url, {
  method: 'POST',
  mode: 'no-cors',
  headers: {
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({ query })
})
    .then(response => response.json())
    .then(data => {
      console.log('Data received:', JSON.stringify(data));
      // Обрабатывайте полученные данные здесь
    })
    .catch(error => console.error('Error:', error))

</script>

<style scoped lang="scss">

</style>
