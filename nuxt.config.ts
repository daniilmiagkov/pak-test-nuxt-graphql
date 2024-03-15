// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    devtools: { enabled: true },
    css: [
        '@/assets/css/main.css', // Путь к вашему global.scss
    ],
    modules: ['@nuxt/ui']


})
