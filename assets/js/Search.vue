<template>
     <form id="search-bar" class="search-bar-stores">
        <input id="search-input" 
               class="search-bar-input" 
               type="text" 
               label="search" 
               placeholder="Rechercher un magasin ou une catégorie"
               v-model="search" 
               v-on:keyup="fetchCategories(event, search)">
        <button class="search-bar-localisation">
            <i class="fa-solid fa-paper-plane"></i>
        </button>
        <button id="button-search" class="search-bar-submit">
            Rechercher
        </button>
    </form>
    <div class="">
        <ul class="list-categories">
            <li class="list-categories-content" v-for="category of categories" v-on:click="selectCategory(category)">
                {{ category.name }}
            </li>
        </ul>
    </div>
</template>
<script>
    import { ref, onMounted } from 'vue';
    import { globalCategory } from '../app.js';

    export default {
        setup() {
            const categories = ref([]);
            const category = ref(null);
            const loading = ref(true);
            const search = ref(null);


            onMounted(() => {
                
            });            

            return {
                categories,
                loading,
                category,
                search
            }
        },
        methods: {
            fetchCategories(event, search) {
                this.loading = true;
                return fetch('/search?search-input='+search).then((response) => {
                    return response.json();
                }).then((data) => {
                    this.categories = JSON.parse(data);
                }).then(() => {
                    this.loading = false;
                });
            },

            selectCategory(category) {
                this.search = category.name;
                globalCategory.category = category;
            }
        }
    }
</script>