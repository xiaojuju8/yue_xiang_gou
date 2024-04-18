<template>
  <el-dialog
      model-value="dialogVisible"
      :title="dialogTitle"
      width="30%"
      @close="handleClose"
  >

    <el-form
        ref="formRef"
        :model="form"
        :rules="rules"
        label-width="100px"
    >
      <el-form-item label="小类名称" prop="name">
        <el-input v-model="form.name" />
      </el-form-item>

      <el-form-item label="所属大类">
        <el-select v-model="form.bigType.id" placeholder="请选择...">
          <el-option
            v-for="item in bigTypeSelectOptions"
            :key="item.id"
            :label="item.name"
            :value="item.id"
          >
          </el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="小类描述" prop="remark">
        <el-input v-model="form.remark" type="textarea" :rows="4"/>
      </el-form-item>

    </el-form>
    <template #footer>
      <span class="dialog-footer">
          <el-button  @click="handleClose">取消</el-button>
          <el-button type="primary" @click="handleConfirm">确认</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script setup>

import {defineEmits, defineProps, ref, watch} from "vue";
import axios from "@/util/axios";
import {ElMessage} from "element-plus";

const tableData=ref([])

const props=defineProps(
    {
      id:{
        type:Number,
        default:-1,
        required:true
      },
      dialogTitle:{
        type:String,
        default:'',
        required:true
      },
      dialogVisible:{
        type:Boolean,
        default:false,
        required:true
      }

    }
)

const form=ref({
  id:-1,
  name:"",
  remark:"",
  bigType:{
    id:""
  }
})

const bigTypeSelectOptions=ref([]);

const initBigTypeSelectList=async ()=>{
  const res=await axios.get("admin/bigType/listAll");
  bigTypeSelectOptions.value=res.data.bigTypeList;
}

initBigTypeSelectList();

const rules=ref({
  name:[
    { required: true, message: '请输入商品小类名称'}
  ],
  remark:[
    { required: true, message: '请输入商品小类描述'}
  ]
})

const formRef=ref(null)


const initFormData=async(id)=>{
  const res=await axios.get("admin/smallType/"+id);
  form.value=res.data.smallType;
}


watch(
    ()=>props.dialogVisible,
    ()=>{
      let id=props.id;
      if(id!=-1){
        initFormData(id)
      }else{
        form.value={
          id:-1,
          name:"",
          remark:"",
          bigType:{
            id:""
          }
        }
      }
    }
)


const emits=defineEmits(['update:modelValue','initSmallTypeList'])

const handleClose=()=>{
  emits('update:modelValue',false)
}

const handleConfirm=()=>{
  formRef.value.validate(async(valid)=>{
    if(valid){

      if (form.value.bigType.id==""){
        ElMessage.error("请选择商品大类");
        return;
      }

      let result=await axios.post("admin/smallType/save",form.value);
      let data=result.data;
      if(data.code==0){
        ElMessage.success("执行成功！")
        formRef.value.resetFields();
        emits("initSmallTypeList")
        handleClose();
      }else{
        ElMessage.error(data.msg);
      }

    }else{
      console.log("fail")
    }
  })
}

</script>

<style scoped>

</style>