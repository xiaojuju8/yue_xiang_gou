<template>
  <el-breadcrumb separator="/">
    <el-breadcrumb-item v-for="(item,index) in breadcrumbList" :key="index">
      <span class="no-redirect" v-if="index==breadcrumbList.length-1">{{item.name}}</span>
      <span class="redirect" v-else @click="handleRedirect(item.path)">{{item.name}}</span>
    </el-breadcrumb-item>

  </el-breadcrumb>
</template>

<script setup>
import {ref,watch} from 'vue';
import {useRoute,useRouter} from "vue-router";
const route=useRoute();
const router=useRouter();

const breadcrumbList=ref([]);
breadcrumbList.value=route.matched;

const handleRedirect=(path)=>{
  router.push(path)
}

const initBreadcrumbList=()=>{
  console.log(route.matched);
  breadcrumbList.value=route.matched;
}

watch(route,()=>{
  initBreadcrumbList();
},{deep:true,immediate:true})
</script>

<style lang="scss" scoped>
.no-redirect{
  cursor:text;
}
.redirect{
  color:#666;
  font-weight:600;
  cursor:pointer;
  &:hover{
    color:#304156
  }
}
</style>