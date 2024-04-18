<template>
  <div class="app-wrapper">
    <el-container>
      <el-aside width="200px" class="sidebar-container"><Menu/></el-aside>
      <el-container>
        <el-header>
          <div class="navbar">
            <Breadcrumb/>
            <div class="navbar-right">
              <Avatar/>
            </div>
          </div>
        </el-header>
        <el-main>
          <router-view/>
        </el-main>
        <el-footer>
          <Footer/>
        </el-footer>
      </el-container>
    </el-container>
  </div>
</template>

<script setup>
import Menu from "@/views/layout/menu/index.vue";
import Breadcrumb from "@/views/layout/header/breadcrumb.vue";
import Avatar from "@/views/layout/header/avatar.vue";
import Footer from '@/views/layout/footer';
</script>

<style lang="scss" scoped>
.app-wrapper {
  position: relative;
  width: 100%;
  height: 100%;
}

.navbar {
  width: 100%;
  height: 60px;
  overflow: hidden;
  background-color: #fff;
  box-shadow: 0 1px 4px rgba(0, 21, 41, 0.08);
  padding: 0 16px;
  display: flex;
  align-items: center;
  box-sizing: border-box;
  position: relative;
  .navbar-right {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: flex-end;
  }

}

:deep(.el-header){
  padding: 0px;
}

.sidebar-container {
  background-color: #2d3a4b;
  height: 100%;
}

:deep(.el-container){
  height: 100%;
}

:deep(ul.el-menu){
  border-right-width: 0px
}
</style>