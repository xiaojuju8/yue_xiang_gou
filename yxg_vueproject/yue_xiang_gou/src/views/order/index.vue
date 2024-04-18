<template>
  <el-card>
    <el-row :gutter="20" class="header">
      <el-col :span="7">
        <el-input placeholder="请输入订单号..." v-model="queryForm.query" clearable></el-input>
      </el-col>
      <el-button type="primary" :icon="Search" @click="initOrderList">搜索</el-button>
    </el-row>
    <el-table :data="tableData" stripe style="width: 100%">
      <el-table-column prop="orderNo" label="订单号" width="250" fixed/>
      <el-table-column prop="wxUserInfo" label="用户昵称" width="200" :formatter="wxUserInfoNickNameFormatter"/>
      <el-table-column prop="totalPrice" label="订单总价" width="100" />
      <el-table-column prop="status" label="订单状态" width="100" :formatter="statusFormatter"/>
      <el-table-column prop="createDate" label="订单创建日期" width="200" />
      <el-table-column prop="payDate" label="订单支付日期" width="200" />
      <el-table-column prop="consignee" label="收货人" width="80" />
      <el-table-column prop="telNumber" label="联系电话" width="150" />
      <el-table-column prop="address" label="收货地址" width="400" />

      <el-table-column prop="action" label="操作" width="300" fixed="right">
        <template v-slot="scope">
          <el-button type="success" @click="handleDialogValue(scope.row.id)">详情</el-button>
          <el-button type="primary" @click="handleOrderStatus(scope.row.id,2)">发货</el-button>
          <el-button type="primary"  @click="handleOrderStatus(scope.row.id,3)">退货</el-button>
          <el-button type="danger" :icon="Delete" @click="handleDelete(scope.row.id)"/>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
        v-model:currentPage="queryForm.pageNum"
        v-model:page-size="queryForm.pageSize"
        :page-sizes="[10, 20, 30, 40,50]"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
    />
  </el-card>
  <Dialog v-model="dialogVisible" :id="id"></Dialog>
</template>

<script setup>
import { Search ,Delete } from '@element-plus/icons-vue'
import { ref } from 'vue'
import axios from "@/util/axios";
import {ElMessage,ElMessageBox} from "element-plus";
import Dialog from "./components/dialog"

const queryForm=ref({
  query:'',
  pageNum:1,
  pageSize:10
})

const total=ref(0)

const tableData = ref([])

const dialogVisible=ref(false)

const id=ref(-1)

const initOrderList=async()=>{
  const res=await axios.post("admin/order/list",queryForm.value)
  tableData.value=res.data.orderList;
  total.value=res.data.total;
}

initOrderList();

const handleDialogValue=(orderId)=>{
  id.value=orderId;
  dialogVisible.value=true
}

const handleSizeChange=(pageSize)=>{
  queryForm.value.pageNum=1;
  queryForm.value.pageSize=pageSize;
  initOrderList();
}

const handleCurrentChange=(pageNum)=>{
  queryForm.value.pageNum=pageNum;
  initOrderList();
}

const wxUserInfoNickNameFormatter=(row)=>{
  return row.wxUserInfo.nickName;
}

const statusFormatter=(row)=>{
  switch (row.status){
    case 1:
      return "待支付"
    case 2:
      return "待发货"
    case 3:
      return "退款/退货"
  }
}

const handleOrderStatus=(id,status)=>{
  ElMessageBox.confirm(
      '您确定要更新这个订单状态码?',
      '系统提示',
      {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
      }
  )
      .then(async() => {
        let res=await axios.post('admin/order/updateStatus',{id:id,status:status})
        if(res.data.code==0){
          ElMessage({
            type: 'success',
            message: '执行成功',
          })
          initOrderList();
        }else {
          ElMessage({
            type: 'error',
            message: res.data.msg,
          })
        }

      })
      .catch(() => {

      })
}

const handleDelete=(id,status)=>{
  ElMessageBox.confirm(
      '您确定要删除这条记录吗?',
      '系统提示',
      {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
      }
  )
      .then(async() => {
        let res=await axios.get('admin/order/delete/'+id)
        if(res.data.code==0){
          ElMessage({
            type: 'success',
            message: '删除成功',
          })
          initOrderList();
        }else {
          ElMessage({
            type: 'error',
            message: res.data.msg,
          })
        }

      })
      .catch(() => {

      })
}
</script>

<style lang="scss" scoped>

.header{
  padding-bottom: 16px;
  box-sizing: border-box;
}

.el-pagination{
  padding-top: 15px;
  box-sizing: border-box;
}



</style>