<template>
  <el-dialog
      model-value="imageDialogVisible"
      title="商品图片更换"
      width="30%"
      @close="handleClose"
      center
  >

    <el-form
        ref="formRef"
        :model="form"
        label-width="100px"
        style="text-align: center"
    >

      <el-upload
          :headers="headers"
          class="avatar-uploader"
          :action="getServerUrl()+'admin/product/uploadImage'"
          :show-file-list="false"
          :on-success="handleAvatarSuccess"
          :before-upload="beforeAvatarUpload"
      >
        <img v-if="imageUrl" :src="imageUrl" class="avatar" />
        <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
      </el-upload>

    </el-form>
    <template #footer>
      <span class="dialog-footer">


     <el-button type="primary" @click="handleConfirm">确认更换</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script setup>

import {defineEmits, defineProps, ref, watch} from "vue";
import axios,{getServerUrl} from "@/util/axios";
import { ElMessage } from 'element-plus'
import { Plus } from '@element-plus/icons-vue'

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

const form=ref({
  id:-1,
  proPic:''
})

const formRef=ref(null)

const imageUrl=ref("")

watch(
    ()=>props.imageDialogValue,
    ()=>{
      form.value=props.imageDialogValue;
      imageUrl.value=getServerUrl()+'image/product/'+form.value.proPic
    },
    {deep:true,immediate:true}
)


const emits=defineEmits(['update:modelValue','initProductList'])

const handleClose=()=>{
  emits('update:modelValue',false)
}

const handleAvatarSuccess=(res)=>{
  imageUrl.value=getServerUrl()+res.data.src
  form.value.proPic=res.data.title;
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

  let result=await axios.post("admin/product/save",form.value);
  let data=result.data;
  if(data.code==0){
    ElMessage.success("执行成功！")
    formRef.value.resetFields();
    emits("initProductList")
    handleClose();
  }else{
    ElMessage.error(data.msg);
  }

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