<template>
     <form id="search-bar" class="search-bar-stores">
        <input id="search-input" 
               class="search-bar-input" 
               type="text" 
               label="search" 
               placeholder="Rechercher un magasin ou une catégorie"
               v-model="search" 
               v-on:keyup="fetchCategories(event, search)">
        <button id="button-search" class="search-bar-submit" v-on:click="display">
            Rechercher
        </button>
    </form>
    <ul class="list-categories" v-on:mouseout="undisplay()" v-if="displayed">
        <li class="list-categories-content" v-for="category of categories" v-on:click="selectCategory(category)">
            {{ category.name }}
        </li>
    </ul>
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
            const displayed = ref(false);

            onMounted(() => {
                
            });            

            return {
                categories,
                loading,
                category,
                search,
                displayed
            }
        },
        methods: {
            fetchCategories(event, search) {
                this.loading = true;
                return fetch('/search?search-input='+search).then((response) => {
                    return response.json();
                }).then((data) => {
                    this.categories = JSON.parse(data);
                    this.displayed = true;
                }).then(() => {
                    this.loading = false;
                });
            },
            selectCategory(category) {
                this.search = category.name;
                this.displayed = false;
                globalCategory.category = category;
            },
            undisplay() {
                this.displayed = false;
            },
            display(event) {
                event.preventDefault();
                event.stopPropagation();
                
                this.displayed = true;
            }
        }
    }
</script>