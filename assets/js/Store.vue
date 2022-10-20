<template>
    <ul class="list-stores" v-if="!loading && stores.length > 0">
        <li class="list-stores-content" v-for="store of stores">
            <div class="icon-favorites" v-on:click="changeFavorite(store)">
                <i class="fa-heart" v-bind:class="{ 'fa-regular': !store.favorite, 'fa-solid' : store.favorite}"></i>
            </div>
            <div class="stores-info">
                <img :src="store.imageUrl">
                {{ store.name }}
                {{ store.address }}
                {{ store.phoneNumber }}
                {{ store.categories }}
                <!-- {{ store.description }} -->
                {{ store.schedule }}
            </div>
        </li>
    </ul>

    <div v-if="loading">
        <i class="fa-solid fa-spinner"></i>
    </div>

    <div v-if="!loading && stores.length == 0">
        Aucun résultat !
    </div>
</template>
<script>
    import { ref, onMounted } from 'vue';
    export default {
        setup() {
            const favorites = ref([]);
            const stores = ref([]);
            const loading = ref(true);

            function fetchStores() {
                loading.value = true;
                return fetch('/stores-by-default').then((response) => {
                    return response.json();
                }).then((data) => {
                    stores.value = JSON.parse(data);
                    console.log(stores);
                }).then(() => {
                    loading.value = false;
                });
            }

            function fetchFavorites() {
                loading.value = true;
                return fetch('/favorites-for-list').then((response) => {
                    return response.json();
                }).then((data) => {
                    favorites.value = JSON.parse(data);
                    console.log(favorites);
                }).then(() => {
                    loading.value = false;
                });
            }

            function bindFavoritesOnStores() {
                stores.value.forEach(store => {
                    favorites.value.forEach(favorite => {
                        if (favorite.storeId == store.id) {
                            store.favorite = true;
                        } else {
                            store.favorite = false;
                        }
                    });
                });
            }

            onMounted(() => {
                fetchStores();
                fetchFavorites();
                bindFavoritesOnStores();
                console.log(stores);
            });            

            return {
                stores,
                loading,
            }
        },
        methods: {
            addFavorite(store) {
                fetch('/add-favorite/'+store.id)
                .then((response) => {
                    if (response.ok) {
                        return response.json();
                    }
                }).then(() => {
                    store.favorite = true;
                })
            },
            removeFavorite(store) {
                fetch('/remove-favorite/'+store.id)
                .then((response) => {
                    if (response.ok) {
                        return response.json();
                    }
                }).then(() => {
                    store.favorite = false;
                })
            },
            changeFavorite(store) {
                if (!store.favorite) {
                    this.addFavorite(store);
                } else {
                    this.removeFavorite(store);
                }
            },
        }
    }
</script>