<template>
<!--
  <table class="table">
    <thead class="table__head">
    <tr class="table__row table__row_head">
      <th class="table__cell table__cell_header">Дата и время операции</th>
      <th class="table__cell table__cell_header">ФИО пациента</th>
      <th class="table__cell table__cell_header">Длительность операции</th>
      <th class="table__cell table__cell_header">ФИО врачей</th>
      <th class="table__cell table__cell_header">Название операции</th>
      <th class="table__cell table__cell_header">Название операционной</th>
      <th class="table__cell table__cell_header">Количество скриншотов</th>
      <th class="table__cell table__cell_header">Количество дорожек</th>
    </tr>
    </thead>
    <tbody class="table__body">
    <tr v-for="record in operationRecords" :key="record.dateTime" class="table__row">
      <td class="table__cell">{{ record.dateTime }}</td>
      <td class="table__cell">{{ record.patientName }}</td>
      <td class="table__cell">{{ record.duration }}</td>
      <td class="table__cell">
        <ul class="table__list">
          <li v-for="doctor in record.doctors" :key="doctor" class="table__item">{{ doctor }}</li>
        </ul>
      </td>
      <td class="table__cell">{{ record.operationName }}</td>
      <td class="table__cell">{{ record.operatingRoom }}</td>
      <td class="table__cell">{{ record.screenshotsCount }}</td>
      <td class="table__cell">{{ record.tracksCount }}</td>
    </tr>
    </tbody>
  </table>
-->
  <div>
    <UTable :rows="rows" />

    <div class="flex justify-end px-3 py-3.5 border-t border-gray-200 dark:border-gray-700">
      <UPagination v-model="page" :page-count="pageCount" :total="operationRecords.length" />
    </div>
  </div>

</template>

<script setup lang="ts">
import {computed, ref} from "@vue/reactivity";

const page = ref(1)
const pageCount = 5

const rows = computed(() => {
  return operationRecords.slice((page.value - 1) * pageCount, (page.value) * pageCount)
})
// Определение интерфейса для операции
interface OperationRecord {
  dateTime: string;
  patientName: string;
  duration: string;
  doctors: string[];
  operationName: string;
  operatingRoom: string;
  screenshotsCount: number;
  tracksCount: number;
}

// Функция для генерации случайной даты и времени в формате YYYY-MM-DD HH:mm
function getRandomDateTime(): string {
  const year = 2024;
  const month = Math.floor(Math.random() * 12) + 1;
  const day = Math.floor(Math.random() * 28) + 1; // Упрощение для целей демонстрации
  const hours = Math.floor(Math.random() * 24);
  const minutes = Math.floor(Math.random() * 60);

  return `${year}-${month.toString().padStart(2, '0')}-${day.toString().padStart(2, '0')} ${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}`;
}

// Функция для генерации случайного имени пациента
function getRandomPatientName(): string {
  const firstNames = ['Иван', 'Петр', 'Мария', 'Анна', 'Сергей', 'Елена'];
  const lastNames = ['Иванов', 'Петров', 'Сидоров', 'Козлова', 'Смирнова', 'Кузнецов'];

  const firstName = firstNames[Math.floor(Math.random() * firstNames.length)];
  const lastName = lastNames[Math.floor(Math.random() * lastNames.length)];

  return `${firstName} ${lastName}`;
}

// Функция для генерации случайной длительности операции
function getRandomDuration(): string {
  const hours = Math.floor(Math.random() * 4) + 1; // От 1 до 4 часов
  const minutes = Math.floor(Math.random() * 60);

  return `${hours}:${minutes.toString().padStart(2, '0')}`;
}

// Функция для генерации случайного списка врачей
function getRandomDoctors(): string[] {
  const doctors = ['Петров Алексей Иванович', 'Сидорова Елена Петровна', 'Иванов Владимир Сергеевич', 'Козлова Ольга Андреевна'];

  const count = Math.floor(Math.random() * 3) + 1; // От 1 до 3 врачей
  const shuffledDoctors = [...doctors].sort(() => Math.random() - 0.5);

  return shuffledDoctors.slice(0, count);
}

// Функция для генерации случайного названия операции
function getRandomOperationName(): string {
  const operations = ['Аппендэктомия', 'Холецистэктомия', 'Гистерэктомия', 'Тонзиллэктомия', 'Риносэптопластика', 'Ламинэктомия'];

  return operations[Math.floor(Math.random() * operations.length)];
}

// Функция для генерации случайного названия операционной
function getRandomOperatingRoom(): string {
  const rooms = ['Операционная №1', 'Операционная №2', 'Операционная №3'];

  return rooms[Math.floor(Math.random() * rooms.length)];
}

// Генерация списка операций
function generateOperationRecords(n: number): OperationRecord[] {
  const records: OperationRecord[] = [];

  for (let i = 0; i < n; i++) {
    const record: OperationRecord = {
      dateTime: getRandomDateTime(),
      patientName: getRandomPatientName(),
      duration: getRandomDuration(),
      doctors: getRandomDoctors(),
      operationName: getRandomOperationName(),
      operatingRoom: getRandomOperatingRoom(),
      screenshotsCount: Math.floor(Math.random() * 10) + 1, // От 1 до 10 скриншотов
      tracksCount: Math.floor(Math.random() * 3) // От 0 до 2 дорожек
    };

    records.push(record);
  }

  return records;
}

// Пример использования: генерация списка из 5 операций
const operationRecords = generateOperationRecords(30);
// console.log(operationRecords);


</script>

<style scoped lang="scss">
.table {
  border-collapse: collapse;
  width: 100%;
}
.table__head {
  background-color: #f2f2f2;
}

.table__row {
  //padding: 10px;

}

.table__cell {
  border: 1px solid black;
  padding: 10px 5px;
}

.table__list {
  margin: 0;
  margin-block-start: 0;
  padding-inline-start: 2em;
}
</style>
