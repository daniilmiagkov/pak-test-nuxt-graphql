<template>
  <div>
    <UTable :rows="rows" />

    <UPagination
        :page-count="page_count"
        v-model="page" :total="length" :ui="{ rounded: 'first-of-type:rounded-s-md last-of-type:rounded-e-md' }">
      <template #prev="{ onClick }">
        <UTooltip text="Previous page">
          <UButton icon="i-heroicons-arrow-small-left-20-solid" color="primary" :ui="{ rounded: 'rounded-full' }" class="rtl:[&_span:first-child]:rotate-180 me-2" @click="onClick" />
        </UTooltip>
      </template>

      <template #next="{ onClick}">
        <UTooltip text="Next page">
          <UButton icon="i-heroicons-arrow-small-right-20-solid" color="primary" :ui="{ rounded: 'rounded-full' }" class="rtl:[&_span:last-child]:rotate-180 ms-2"
           @click="() => {
             onClick();
             getRows()
           } " />
        </UTooltip>
      </template>
    </UPagination>
  </div>

</template>

<script setup lang="ts">
import {computed, ref} from "@vue/reactivity";
import {fetchGql} from "@/utils/fetchGql";
import {onMounted} from "vue";

const page = ref(1)
const page_count = ref(5)
let length = ref();


function getRows() {
  console.log(rows.value)
  console.log(rows.value!== undefined ? ", value: " + rows.value.at(-1).id : "")
  fetchGql(`
  query {
  getAllRecords(first: ${page_count.value} ${rows.value!== undefined ? ', after: "' + rows.value.at(-1).id + '"' : ""}) {
    id
    dateTime
    patientName
    duration
    doctors
    operationName
    operatingRoom
    screenshotsCount
    tracksCount
  }
}
  `)
      .then(
          data => {
            console.log(data.data)
            rows.value = data.data.getAllRecords;
          }
      )
}
onMounted(() => {
  getRows();
  fetchGql(`
query {
  operationRecordsCount
}
`)
    .then(data => {
      // Обрабатывайте полученные данные здесь
      length.value= data.data.operationRecordsCount;
      console.log('Data received:', data.data.operationRecordsCount);
    })
    .catch(error => {
      // Обрабатывайте ошибку здесь
      console.error('Error:', error);
    });
})
let rows = ref()

</script>

<style scoped lang="scss">

</style>
