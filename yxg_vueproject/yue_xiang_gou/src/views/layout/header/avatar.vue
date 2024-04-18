<template>
  <el-dropdown>
    <span class="el-dropdown-link">
      <el-avatar shape="square" :size="40" :src="squareUrl" />
    </span>
    <template #dropdown>
      <el-dropdown-menu>
        <el-dropdown-item @click="logout">安全退出</el-dropdown-item>
      </el-dropdown-menu>
    </template>
  </el-dropdown>


</template>

<script setup>
import { ref } from 'vue';
import { useStore } from 'vuex';

const squareUrl=ref("http://www.java1234.com/gg/avatar.jpg")

const store=useStore()
const logout=()=>{
  store.dispatch('logout')
}
</script>

<style lang="scss" scoped>

</style>