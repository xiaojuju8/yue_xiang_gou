<template>
  <el-dialog
      model-value="productSwiperImageDialogVisible"
      title="商品轮播图片管理"
      width="30%"
      @close="handleClose"
      center
  >

    <el-form
        ref="formRef"
        :model="form"
        label-width="100px"
        style="text-align: center"
        :rules="rules"
    >

      <el-form-item label="排列序号" prop="sort">
        <el-input v-model="form.sort" style="width: 100px"/>
      </el-form-item>


      <el-upload
          :headers="headers"
          class="avatar-uploader"
          :action="getServerUrl()+'admin/productSwiperImage/uploadImage'"
          :show-file-list="false"
          :on-success="handleAvatarSuccess"
          :before-upload="beforeAvatarUpload"
      >
        <img v-if="imageUrl" :src="imageUrl" class="avatar" />
        <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
      </el-upload>

      <el-form-item >
        <el-button type="primary" @click="handleConfirm">添加</el-button>
      </el-form-item>

    </el-form>

    <el-table :data="tableData" stripe style="width: 100%">
      <el-table-column type="index" width="50" />
      <el-table-column prop="image" label="轮播图片" >
        <template v-slot="scope">
          <img :src="getServerUrl()+'image/productSwiperImgs/'+scope.row.image" width="80" height="80"/>
        </template>
      </el-table-column>
      <el-table-column prop="sort" label="排列序号" width="100"/>
      <el-table-column prop="action" label="操作" width="100">
        <template v-slot="scope">
          <el-button type="danger" :icon="Delete" @click="handleDelete(scope.row.id)"/>
        </template>
      </el-table-column>
    </el-table>

  </el-dialog>
</template>

<script setup>

import {defineEmits, defineProps, ref, watch} from "vue";
import axios,{getServerUrl} from "@/util/axios";
import {ElMessage, ElMessageBox} from 'element-plus'
import { Plus,Delete } from '@element-plus/icons-vue'

const tableData=ref([])

const props=defineProps(
    {
      imageDialogValue:{
        type:Object,
        default:()=>{},
        required:true
      }
    }
)

const headers=ref({
  token:window.sessionStorage.getItem("token")
})


const rules=ref({

  sort: [
    {
      required: true,
      message: '请输入排列序号'
    },
    {
      type:'number',
      message: '排序序号必须是数值类型',
      transform: (value) => Number(value)
    }
  ]

})

const form=ref({
  productId:-1,
  sort:0,
  image:''
})

const formRef=ref(null)

const imageUrl=ref("")

const initProductSwiperImageList=async()=>{
  const res=await axios.get("admin/productSwiperImage/list/"+form.value.productId)
  tableData.value=res.data.list;
}


watch(
    ()=>props.imageDialogValue,
    ()=>{
      form.value.productId=props.imageDialogValue.id;
      initProductSwiperImageList();
    },
    {deep:true,immediate:true}
)


const emits=defineEmits(['update:modelValue'])





const handleAvatarSuccess=(res)=>{
  imageUrl.value=getServerUrl()+res.data.src
  form.value.image=res.data.title;
}


const beforeAvatarUpload = (file) => {
  const isJPG = file.type === 'image/jpeg'
  const isLt2M = file.size / 1024 / 1024 < 2

  if (!isJPG) {
    ElMessage.error('图片必须是jpg格式')
  }
  if (!isLt2M) {
    ElMessage.error('图片大小不能超过2M!')
  }
  return isJPG && isLt2M
}

const handleConfirm=async()=>{

  formRef.value.validate(async(valid)=> {

    if(valid){
      let result=await axios.post("admin/productSwiperImage/add",form.value);
      let data=result.data;
      if(data.code==0){
        ElMessage.success("执行成功！")
        formRef.value.resetFields();
        initProductSwiperImageList();
        imageUrl.value=""

      }else{
        ElMessage.error(data.msg);
      }
    }

  });

}

const handleClose=()=>{
  emits('update:modelValue',false)
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
        let res=await axios.get('admin/productSwiperImage/delete/'+id)
        if(res.data.code==0){
          ElMessage({
            type: 'success',
            message: '删除成功',
          })
          initProductSwiperImageList();
        }else{
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

<style>

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}

</style>