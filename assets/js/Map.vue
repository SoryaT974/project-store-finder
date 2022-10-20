<template>
  <ol-map :loadTilesWhileAnimating="true" :loadTilesWhileInteracting="true" style="height:400px">
  
    <ol-view ref="view" :center="center" :rotation="rotation" :zoom="zoom" :projection="projection" />
  
    <ol-tile-layer>
        <ol-source-osm />
    </ol-tile-layer>

    <ol-overlay :position="[40,40]">
        <template v-slot="slotProps">
            <div class="overlay-content">
                Hello world!<br>
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
export default {
    setup() {
        const center = ref([40, 40])
        const projection = ref('EPSG:4326')
        const zoom = ref(8)
        const rotation = ref(0)
        
        return {
            center,
            projection,
            zoom,
            rotation
        }
    },
    data() {
        return [
            {stores: ['store 1', 'store 2']}
        ]
    }
}
</script>
