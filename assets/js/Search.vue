<template>
     <form id="search-bar" class="search-bar-stores" v-on:keyup.esc="undisplay()">
        <input id="search-input" 
               class="search-bar-input" 
               type="text" 
               label="search" 
               placeholder="Rechercher une catégorie, appuyer sur échap pour masquer les résultats"
               autocomplete="off"
               v-model="search" 
               v-on:keyup="fetchCategories($event, search)">
        <button id="button-search" class="search-bar-submit" v-on:click="display">
            Rechercher
        </button>
    </form>
    <ul class="list-categories" v-if="displayed">
        <li class="list-categories-content" v-for="category of categories" v-on:click="selectCategory(category)">
            {{ category.name }}
        </li>
    </ul>
</template>
<script>
    import { ref } from 'vue';
    import { globalCategory } from '../app.js';

    export default {
        setup() {
            const categories = ref([]);
            const category = ref(null);
            const search = ref(null);
            const displayed = ref(false);          

            return {
                categories,
                category,
                search,
                displayed
            }
        },
        methods: {
            fetchCategories(event, search) {
                // Escape is already bind on undisplay()
                if (event.code === "Escape") {
                    return;
                }

                return fetch('/search?search-input='+search).then((response) => {
                    return response.json();
                }).then((data) => {
                    this.categories = JSON.parse(data);
                    this.displayed = true;
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