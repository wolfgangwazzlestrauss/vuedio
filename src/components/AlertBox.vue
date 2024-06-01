<template>
  <section class="toast toast-center bottom-8" data-testid="alert-box">
    <div class="alert" id="alert" :class="className">
      <div class="icon-[ph--bell-fill] size-6"></div>
      <div>
        <h3 class="font-bold">{{ song.alert.type.toUpperCase() }}</h3>
        <div class="text-sm">{{ song.alert.message }}</div>
      </div>
      <button class="btn btn-sm ml-4" @click="song.resetAlert">Close</button>
    </div>
  </section>
</template>

<script setup lang="ts">
import { computed } from "vue";
import { useSongStore } from "@/stores/song";

const alertClasses: Record<string, string> = {
  error: "alert-error",
};

const song = useSongStore();
const className = computed(() => alertClasses[song.alert.type]);
</script>
