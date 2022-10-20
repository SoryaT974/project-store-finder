/*
 * Welcome to your app's main JavaScript file!
 *
 * We recommend including the built version of this JavaScript file
 * (and its CSS file) in your base layout (base.html.twig).
 */

// any CSS you import will output into a single css file (app.css in this case)
import './styles/app.css';

import OpenLayersMap from 'vue3-openlayers'
import 'vue3-openlayers/dist/vue3-openlayers.css'

import { createApp } from 'vue';
import Map from './js/Map.vue';

import Store from './js/Store.vue';

createApp(Store).mount('#vue-store');

import Search from './js/Search.vue';

createApp(Search).mount('#search-vue');

const app = createApp(Map);
app.use(OpenLayersMap);

app.mount('#vue-map');
