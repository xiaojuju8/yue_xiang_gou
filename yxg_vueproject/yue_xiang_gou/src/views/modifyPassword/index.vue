<template>
  <el-card>
    <el-form
        ref="formRef"
        :model="form"
        :rules="rules"
        label-width="150px"
    >
      <el-form-item label="用户名" prop="userName">
        <el-input v-model="form.userName" disabled/>
      </el-form-item>
      <el-form-item label="原密码" prop="oldPassword">
        <el-input v-model="form.oldPassword" type="password"/>
      </el-form-item>
      <el-form-item label="新密码" prop="newPassword">
        <el-input v-model="form.newPassword" type="password"/>
      </el-form-item>
      <el-form-item label="确认新密码" prop="newPassword2">
        <el-input v-model="form.newPassword2" type="password"/>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">确认修改</el-button>
      </el-form-item>
    </el-form>
  </el-card>
</template>

<script setup>
import { ref } from 'vue'
import {ElMessage} from 'element-plus'
import axios from '@/util/axios'

const form=ref({
  userName:"",
  password:"",
  oldPassword:"",
  newPassword:"",
  newPassword2:""
})

const rules=ref({
  userName:[
    { required: true, message: '请输入用户名'}
  ],
  oldPassword:[
    { required: true, message: '请输入密码'}
  ],
  newPassword:[
    { required: true, message: '请输入新密码'}
  ],
  newPassword2:[
    { required: true, message: '请输入确认新密码'}
  ]
})

const formRef=ref(null)

const initFormData=()=>{
  let userInfoJson=window.sessionStorage.getItem("userInfo");
  form.value=JSON.parse(userInfoJson);
}

initFormData();

const onSubmit=()=>{
  formRef.value.validate(async(valid)=>{
    if(valid){
      if(form.value.oldPassword!==form.value.password){
        ElMessage.error("原密码错误！");
      }else if(form.value.newPassword!==form.value.newPassword2){
        ElMessage.error("确认新密码错误！");
      }else{
        try{
          let result=await axios.post("admin/modifyPassword",form.value);
          let data=result.data;
          if(data.code==0){
            ElMessage.success("密码修改成功，请重新登录后生效")
            formRef.value.resetFields();
          }else{
            ElMessage.error(data.msg);
          }
        }catch(err){
          console.log(err)
          ElMessage.error("系统运行出错，请联系管理员");
        }
      }

    }else{
      console.log("fail")
    }
  })
}

</script>

<style lang="scss" scoped>

.el-input{
  width: 300px;
}
</style>