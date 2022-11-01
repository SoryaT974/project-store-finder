<template>
    <h2 class="title-result">Vos magasins de reptiles à proximité ({{ stores.length }} magasins)</h2>
    <div class="list-map-stores">
        <div class="list-container">
            <ul class="list-stores" v-if="!loading && stores.length > 0">
                <li class="list-stores-content" v-for="store of stores">
                    <div class="icon-favorites" v-on:click="changeFavorite(store)">
                        <i class="fa-heart" v-bind:class="{ 'fa-regular': !store.favorite, 'fa-solid' : store.favorite}"></i>
                    </div>
                    <div class="stores-info" v-on:click="globalStore.setStore(store)">
                        <span class="store-name">{{ store.name }}</span>
                        <div>
                            {{ store.address.streetNumber }} {{ store.address.streetName }}<br/>
                            {{ store.address.city }} {{ store.address.postalCode }}<br/>
                            {{ store.address.country }}
                        </div>
                        {{ store.phoneNumber }}
                        {{ store.categories }}
                        <div v-for="schedule of store.schedule">
                            Horaires : {{ schedule }}
                        </div>
                    </div>
                </li>
            </ul>
        
            <div v-if="loading">
                <i class="fa-solid fa-spinner"></i>
            </div>
        
            <div v-if="!loading && stores.length == 0">
                Aucun résultat !
            </div>
                            
        </div>
        <div class="map-stores-container">
            <div class="map-stores-content">
                <Map :stores="stores"/>
            </div>
        </div>
    </div>
</template>
<script>
    import { ref, onMounted } from 'vue';
    import Map from './Map.vue';
    import { globalStore, globalCategory } from '../app.js';

    export default {
        components: {
            Map
        },
        setup() {
            const favorites = ref([]);
            const stores = ref([]);
            const store = ref(null);
            const loading = ref(true);

            function fetchStores() {
                loading.value = true;
                return fetch('/stores-by-default').then((response) => {
                    return response.json();
                }).then((data) => {
                    stores.value = JSON.parse(data);
                }).then(() => {
                    loading.value = false;
                    fetchFavorites();
                });
            }

            function fetchFavorites() {
                loading.value = true;
                return fetch('/favorites-for-list').then((response) => {
                    return response.json();
                }).then((data) => {
                    favorites.value = JSON.parse(data);
                }).then(() => {
                    loading.value = false;
                    bindFavoritesOnStores();
                });
            }

            function bindFavoritesOnStores() {
                stores.value.forEach(storeElem => {
                    favorites.value.forEach(favorite => {
                        if (favorite.store.id == storeElem.id) {
                            storeElem.favorite = true;
                        }
                    });
                });
            }

            onMounted(() => {
                fetchStores();
            });            

            return {
                stores,
                loading,
                store            }
        },
        methods: {
            addFavorite(store) {
                fetch('/add-favorite/'+store.id)
                .then((response) => {
                    if (response.ok) {
                        return response.json();
                    }

                    if (response.status === 401 || response.status === 403) {
                        throw new Error('Not connected')
                    }
                }).then(() => {
                    store.favorite = true;
                }).catch((error) => {
                    alert("Merci de vous connecter avant d'utiliser les favoris.");
                })
            },
            removeFavorite(store) {
                fetch('/remove-ajax-favorite/'+store.id)
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
            fetchStoresByCategory(category) {
                this.loading = true;
                fetch('/stores-by-category/'+category.id)
                .then((response) => {
                    if (response.ok) {
                        return response.json();
                    }
                }) .then((data) => {
                    this.stores = JSON.parse(data);
                    this.loading = false;
                })
            },
        },
        data() {
            return {
                globalCategory,
                globalStore
            };
        },
        watch: {
            globalCategory: {
                handler(newCategory) {
                    if (newCategory !== undefined) {
                        this.fetchStoresByCategory(newCategory.category);
                    }
                },
                deep: true,
            }
        }
    }
</script>