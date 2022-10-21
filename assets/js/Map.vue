<template>
  <ol-map :loadTilesWhileAnimating="true" :loadTilesWhileInteracting="true" style="height:400px">
  
    <ol-view ref="view" :center="center" :rotation="rotation" :zoom="zoom" :projection="projection" />
  
    <ol-tile-layer>
        <ol-source-osm />
    </ol-tile-layer>

    <ol-overlay v-if="storage.store" :store="storage.store" :position="[storage.store.longitude, storage.store.latitude]">
        <template v-slot="slotProps">
            <div class="overlay-content">
                {{ storage.store.name }} <br>
                Position: {{ slotProps.position }}
            </div>
        </template>
    </ol-overlay>
  
  </ol-map>
</template>

<script>
import {
  ref
} from 'vue'
import { storage } from '../app.js'

export default {
    props: ['stores'],
    setup() {
        const center = ref([4.85, 45.75])
        const projection = ref('EPSG:4326')
        const zoom = ref(11)
        const rotation = ref(0)
        
        return {
            center,
            projection,
            zoom,
            rotation
        }
    },
    data() {
        return {storage};
    }
}
</script>
