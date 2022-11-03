<template>
  <ol-map :loadTilesWhileAnimating="true" :loadTilesWhileInteracting="true" style="height:400px">
  
    <ol-view ref="view" :center="center" :rotation="rotation" :zoom="zoom" :projection="projection" />
  
    <ol-tile-layer>
        <ol-source-osm />
    </ol-tile-layer>

    <ol-vector-layer>
        <ol-source-vector>
            <ol-feature>
                <ol-geom-multi-point :coordinates="storesCoordinates"></ol-geom-multi-point>
                <ol-style>
                    <ol-style-circle :radius="radius">
                        <ol-style-fill :color="fillColor"></ol-style-fill>
                        <ol-style-stroke :color="strokeColor" :width="strokeWidth"></ol-style-stroke>
                    </ol-style-circle>
                </ol-style>
            </ol-feature>
        </ol-source-vector>
    </ol-vector-layer>

    <ol-overlay v-if="globalStore.store" :store="globalStore.store" :position="[globalStore.store.longitude, globalStore.store.latitude]">
        <template v-slot="slotProps">
            <div class="overlay-content">
                {{ globalStore.store.name }}
            </div>
        </template>
    </ol-overlay>
  
  </ol-map>
</template>

<script>
import {
  ref
} from 'vue'
import { globalStore } from '../app.js'

export default {
    props: ['stores'],
    setup() {
        const center = ref([4.85, 45.75])
        const projection = ref('EPSG:4326')
        const zoom = ref(4)
        const rotation = ref(0)
        const radius = ref(10)
        const strokeWidth = ref(4)
        const strokeColor = ref('red')
        const fillColor = ref('white')
        const storesCoordinates = ref([]);
        
        return {
            center,
            projection,
            zoom,
            rotation,
            radius,
            strokeWidth,
            strokeColor,
            fillColor,
            storesCoordinates
        }
    },
    data() {
        return {globalStore};
    },
    watch: {
        stores: 
        {
            handler(newValue) {
                this.storesCoordinates = [];
                let totalLatitude = 0;
                let totalLongitude = 0;
                newValue.forEach(store => {
                    this.storesCoordinates.push([store.longitude, store.latitude]);
                    totalLatitude += store.latitude;
                    totalLongitude += store.longitude;
                });
                this.center = [totalLongitude/newValue.length, totalLatitude/newValue.length];
                this.zoom = 6;
            },
            immediate: true
        },
        globalStore: {
            handler(newValue) {
                this.zoom = 11;
                this.center = [newValue.store.longitude, newValue.store.latitude];
            },
            deep: true
        }
    }
}
</script>
