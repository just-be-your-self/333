<template>
	<div class="addEdit-block" style="width: 100%;">
		<el-form
			:style='{"padding":"30px","boxShadow":"0 2px 6px #ddd","borderRadius":"10px","background":"#ffffff"}'
			class="add-update-preview"
			ref="ruleForm"
			:model="ruleForm"
			:rules="rules"
			label-width="80px"
		>
			<template >
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="运输车次" prop="yunshucheci">
					<el-input v-model="ruleForm.yunshucheci" placeholder="运输车次" clearable  :readonly="ro.yunshucheci"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="运输车次" prop="yunshucheci">
					<el-input v-model="ruleForm.yunshucheci" placeholder="运输车次" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="危险品编号" prop="weixianpinbianhao">
					<el-input v-model="ruleForm.weixianpinbianhao" placeholder="危险品编号" clearable  :readonly="ro.weixianpinbianhao"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="危险品编号" prop="weixianpinbianhao">
					<el-input v-model="ruleForm.weixianpinbianhao" placeholder="危险品编号" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="危险品名称" prop="weixianpinmingcheng">
					<el-input v-model="ruleForm.weixianpinmingcheng" placeholder="危险品名称" clearable  :readonly="ro.weixianpinmingcheng"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="危险品名称" prop="weixianpinmingcheng">
					<el-input v-model="ruleForm.weixianpinmingcheng" placeholder="危险品名称" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="数量" prop="shuliang">
					<el-input v-model="ruleForm.shuliang" placeholder="数量" clearable  :readonly="ro.shuliang"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="数量" prop="shuliang">
					<el-input v-model="ruleForm.shuliang" placeholder="数量" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="起点" prop="qidian">
					<el-input v-model="ruleForm.qidian" placeholder="起点" clearable  :readonly="ro.qidian"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="起点" prop="qidian">
					<el-input v-model="ruleForm.qidian" placeholder="起点" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="终点" prop="zhongdian">
					<el-input v-model="ruleForm.zhongdian" placeholder="终点" clearable  :readonly="ro.zhongdian"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="终点" prop="zhongdian">
					<el-input v-model="ruleForm.zhongdian" placeholder="终点" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="select" v-if="type!='info'"  label="状态" prop="zhuangtai">
					<el-select :disabled="ro.zhuangtai" v-model="ruleForm.zhuangtai" placeholder="请选择状态" >
						<el-option
							v-for="(item,index) in zhuangtaiOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="状态" prop="zhuangtai">
					<el-input v-model="ruleForm.zhuangtai"
						placeholder="状态" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="账号" prop="zhanghao">
					<el-input v-model="ruleForm.zhanghao" placeholder="账号" clearable  :readonly="ro.zhanghao"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="账号" prop="zhanghao">
					<el-input v-model="ruleForm.zhanghao" placeholder="账号" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="姓名" prop="xingming">
					<el-input v-model="ruleForm.xingming" placeholder="姓名" clearable  :readonly="ro.xingming"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="姓名" prop="xingming">
					<el-input v-model="ruleForm.xingming" placeholder="姓名" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="车牌号" prop="chepaihao">
					<el-input v-model="ruleForm.chepaihao" placeholder="车牌号" clearable  :readonly="ro.chepaihao"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="车牌号" prop="chepaihao">
					<el-input v-model="ruleForm.chepaihao" placeholder="车牌号" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="车辆品牌" prop="cheliangpinpai">
					<el-input v-model="ruleForm.cheliangpinpai" placeholder="车辆品牌" clearable  :readonly="ro.cheliangpinpai"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="车辆品牌" prop="cheliangpinpai">
					<el-input v-model="ruleForm.cheliangpinpai" placeholder="车辆品牌" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="date" v-if="type!='info'" label="开始时间" prop="kaishishijian">
					<el-date-picker
						value-format="yyyy-MM-dd HH:mm:ss"
						v-model="ruleForm.kaishishijian" 
						type="datetime"
						:readonly="ro.kaishishijian"
						placeholder="开始时间"
					></el-date-picker>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-else-if="ruleForm.kaishishijian" label="开始时间" prop="kaishishijian">
					<el-input v-model="ruleForm.kaishishijian" placeholder="开始时间" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="date" v-if="type!='info' && ruleForm.zhuangtai === '已完成'" label="结束时间" prop="jieshushijian">
					<el-date-picker
						value-format="yyyy-MM-dd HH:mm:ss"
						v-model="ruleForm.jieshushijian" 
						type="datetime"
						:readonly="ro.jieshushijian"
						placeholder="结束时间"
					></el-date-picker>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-else-if="ruleForm.jieshushijian" label="结束时间" prop="jieshushijian">
					<el-input v-model="ruleForm.jieshushijian" placeholder="结束时间" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="速度" prop="sudu">
					<el-input v-model="ruleForm.sudu" placeholder="速度" clearable  :readonly="ro.sudu"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="速度" prop="sudu">
					<el-input v-model="ruleForm.sudu" placeholder="速度" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="textarea" v-if="type!='info'" label="运输路径" prop="yunshulujing">
					<el-input
					  style="min-width: 200px; max-width: 600px;"
					  type="textarea"
					  :rows="4"
					  placeholder="运输路径"
					  v-model="ruleForm.yunshulujing" >
					</el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else-if="ruleForm.yunshulujing" label="运输路径" prop="yunshulujing">
					<span :style='{"border":"1px solid #5497f2","padding":"0 40px","color":"#bbbbbb","borderRadius":"20px 40px","display":"inline-block","fontSize":"14px","lineHeight":"40px","fontWeight":"500"}'>{{ruleForm.yunshulujing}}</span>
				</el-form-item>
			</template>
			<el-form-item :style='{"padding":"0","margin":"30px 0 0 0"}' class="btn">
				<el-button :style='{"border":"0","cursor":"pointer","padding":"0","margin":"0 30px 0 0","outline":"none","color":"rgba(255, 255, 255, 1)","borderRadius":"20px 40px","background":"#5497f2","width":"128px","lineHeight":"40px","fontSize":"14px","height":"40px"}'  v-if="type!='info'" type="primary" class="btn-success" @click="onSubmit">提交</el-button>
				<el-button :style='{"border":"1px solid rgba(64, 158, 255, 1)","cursor":"pointer","padding":"0","margin":"0","outline":"none","color":"rgba(64, 158, 255, 1)","borderRadius":"20px 40px","background":"rgba(255, 255, 255, 1)","width":"128px","lineHeight":"40px","fontSize":"14px","height":"40px"}' v-if="type!='info'" class="btn-close" @click="back()">取消</el-button>
				<el-button :style='{"border":"1px solid rgba(64, 158, 255, 1)","cursor":"pointer","padding":"0","margin":"0","outline":"none","color":"rgba(64, 158, 255, 1)","borderRadius":"20px 40px","background":"rgba(255, 255, 255, 1)","width":"128px","lineHeight":"40px","fontSize":"14px","height":"40px"}' v-if="type=='info'" class="btn-close" @click="back()">返回</el-button>
			</el-form-item>
		</el-form>
    
	</div>
</template>
<script>
// 数字，邮件，手机，url，身份证校验
import { isNumber,isIntNumer,isEmail,isPhone, isMobile,isURL,checkIdCard } from "@/utils/validate";
export default {
	data() {
		let self = this
		var validateIdCard = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!checkIdCard(value)) {
				callback(new Error("请输入正确的身份证号码"));
			} else {
				callback();
			}
		};
		var validateUrl = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isURL(value)) {
				callback(new Error("请输入正确的URL地址"));
			} else {
				callback();
			}
		};
		var validateMobile = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isMobile(value)) {
				callback(new Error("请输入正确的手机号码"));
			} else {
				callback();
			}
		};
		var validatePhone = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isPhone(value)) {
				callback(new Error("请输入正确的电话号码"));
			} else {
				callback();
			}
		};
		var validateEmail = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isEmail(value)) {
				callback(new Error("请输入正确的邮箱地址"));
			} else {
				callback();
			}
		};
		var validateNumber = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isNumber(value)) {
				callback(new Error("请输入数字"));
			} else {
				callback();
			}
		};
		var validateIntNumber = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isIntNumer(value)) {
				callback(new Error("请输入整数"));
			} else {
				callback();
			}
		};
		return {
			id: '',
			type: '',
			
			
			ro:{
				yunshucheci : false,
				weixianpinbianhao : false,
				weixianpinmingcheng : false,
				shuliang : false,
				qidian : false,
				zhongdian : false,
				zhuangtai : false,
				yunshulujing : false,
				zhanghao : false,
				xingming : false,
				chepaihao : false,
				cheliangpinpai : false,
				kaishishijian : false,
				jieshushijian : false,
				sudu : false,
				tupian : false,
				userid : false,
				longitude : false,
				latitude : false,
				fulladdress : false,
			},
			
			// 地图
			routeMapVisiable: false,
			tempRoute: [],
			zoom: 12,
			center: [116.410426, 39.934946],
			markers: [],
			searchOption: {
				citylimit: false
			},
			routeMapEvents: {
				click: (e) => {
					let { lng, lat } = e.lnglat
					this.tempRoute.push([lng, lat])
				}
			},
			
			ruleForm: {
				yunshucheci: '',
				weixianpinbianhao: '',
				weixianpinmingcheng: '',
				shuliang: '',
				qidian: '',
				zhongdian: '',
				zhuangtai: '运输完成',
				yunshulujing: '',
				zhanghao: '',
				xingming: '',
				chepaihao: '',
				cheliangpinpai: '',
				kaishishijian: '',
				jieshushijian: '',
				sudu: '',
				tupian: '',
				userid: '',
				longitude: '',
				latitude: '',
				fulladdress: '',
			},
		
			zhuangtaiOptions: "进行中,已完成".split(','),
			
			rules: {
				yunshucheci: [
				],
				weixianpinbianhao: [
				],
				weixianpinmingcheng: [
				],
				shuliang: [
					{ validator: validateIntNumber, trigger: 'blur' },
				],
				qidian: [
				],
				zhongdian: [
				],
				zhuangtai: [
				],
				yunshulujing: [
				],
				zhanghao: [
				],
				xingming: [
				],
				chepaihao: [
				],
				cheliangpinpai: [
				],
				kaishishijian: [
				],
				jieshushijian: [
				],
				sudu: [
				],
				tupian: [
				],
				userid: [
				],
				longitude: [
					{ validator: validateNumber, trigger: 'blur' },
				],
				latitude: [
					{ validator: validateNumber, trigger: 'blur' },
				],
				fulladdress: [
				],
			}
		};
	},
	props: ["parent"],
	computed: {



	},
	created() {
		this.ruleForm.kaishishijian = this.getCurDateTime()
	},
	methods: {
		openRouteMap() {
			this.routeMapVisiable = true;
			if (this.ruleForm.yunshulujing) {
				try {
					this.tempRoute = JSON.parse(this.ruleForm.yunshulujing);
				} catch (e) {
					this.tempRoute = [];
				}
			} else {
				this.tempRoute = [];
			}
		},
		saveRoute() {
			this.ruleForm.yunshulujing = JSON.stringify(this.tempRoute);
			this.routeMapVisiable = false;
		},
		
		// 下载
		download(file){
			window.open(`${file}`)
		},
		// 初始化
		init(id,type) {
			if (id) {
				this.id = id;
				this.type = type;
			}
			if(this.type=='info'||this.type=='else'){
				this.info(id);
			}else if(this.type=='logistics'){
				this.logistics=false;
				this.info(id);
			}else if(this.type=='cross'){
				var obj = this.$storage.getObj('crossObj');
				for (var o in obj){
						if(o=='yunshucheci'){
							this.ruleForm.yunshucheci = obj[o];
							this.ro.yunshucheci = true;
							continue;
						}
						if(o=='weixianpinbianhao'){
							this.ruleForm.weixianpinbianhao = obj[o];
							this.ro.weixianpinbianhao = true;
							continue;
						}
						if(o=='weixianpinmingcheng'){
							this.ruleForm.weixianpinmingcheng = obj[o];
							this.ro.weixianpinmingcheng = true;
							continue;
						}
						if(o=='shuliang'){
							this.ruleForm.shuliang = obj[o];
							this.ro.shuliang = true;
							continue;
						}
						if(o=='qidian'){
							this.ruleForm.qidian = obj[o];
							this.ro.qidian = true;
							continue;
						}
						if(o=='zhongdian'){
							this.ruleForm.zhongdian = obj[o];
							this.ro.zhongdian = true;
							continue;
						}
						if(o=='zhuangtai'){
							this.ruleForm.zhuangtai = obj[o];
							this.ro.zhuangtai = true;
							continue;
						}
						if(o=='yunshulujing'){
							this.ruleForm.yunshulujing = obj[o];
							continue;
						}
						if(o=='zhanghao'){
							this.ruleForm.zhanghao = obj[o];
							this.ro.zhanghao = true;
							continue;
						}
						if(o=='xingming'){
							this.ruleForm.xingming = obj[o];
							this.ro.xingming = true;
							continue;
						}
						if(o=='chepaihao'){
							this.ruleForm.chepaihao = obj[o];
							this.ro.chepaihao = true;
							continue;
						}
						if(o=='cheliangpinpai'){
							this.ruleForm.cheliangpinpai = obj[o];
							this.ro.cheliangpinpai = true;
							continue;
						}
						if(o=='kaishishijian'){
							this.ruleForm.kaishishijian = obj[o];
							this.ro.kaishishijian = true;
							continue;
						}
						if(o=='jieshushijian'){
							this.ruleForm.jieshushijian = obj[o];
							continue;
						}
						if(o=='sudu'){
							this.ruleForm.sudu = obj[o];
							continue;
						}
						if(o=='tupian'){
							this.ruleForm.tupian = obj[o];
							this.ro.tupian = true;
							continue;
						}
						if(o=='userid'){
							this.ruleForm.userid = obj[o];
							this.ro.userid = true;
							continue;
						}
						if(o=='longitude'){
							this.ruleForm.longitude = obj[o];
							this.ro.longitude = true;
							continue;
						}
						if(o=='latitude'){
							this.ruleForm.latitude = obj[o];
							this.ro.latitude = true;
							continue;
						}
						if(o=='fulladdress'){
							this.ruleForm.fulladdress = obj[o];
							this.ro.fulladdress = true;
							continue;
						}
				}
				







				this.ruleForm.zhuangtai='进行中'
				this.ruleForm.jieshushijian=''
				if(!this.ruleForm.sudu){
					this.ruleForm.sudu = '60'
				}













			}
			
			
			// 获取用户信息
			this.$http({
				url: `${this.$storage.get('sessionTable')}/session`,
				method: "get"
			}).then(({ data }) => {
				if (data && data.code === 0) {
					
					var json = data.data;
					if(json.zhanghao!=''&&json.zhanghao && this.$storage.get("role")!="管理员"){
						this.ruleForm.zhanghao = json.zhanghao
						this.ro.zhanghao = true;
					}
					if(json.xingming!=''&&json.xingming && this.$storage.get("role")!="管理员"){
						this.ruleForm.xingming = json.xingming
						this.ro.xingming = true;
					}
				} else {
					this.$message.error(data.msg);
				}
			});
			
            this.zhuangtaiOptions = "进行中,已完成".split(',')
			
		},
    // 多级联动参数

    info(id) {
      this.$http({
        url: `yunshuxinxi/info/${id}`,
        method: "get"
      }).then(({ data }) => {
        if (data && data.code === 0) {
        this.ruleForm = data.data;
	//解决前台上传图片后台不显示的问题
	let reg=new RegExp('../../../upload','g')//g代表全部
        } else {
          this.$message.error(data.msg);
        }
      });
    },


    // 提交
    onSubmit() {
































	if(this.ruleForm.tupian!=null) {
		this.ruleForm.tupian = this.ruleForm.tupian.replace(new RegExp(this.$base.url,"g"),"");
	}









var objcross = this.$storage.getObj('crossObj');

      //更新跨表属性
       var crossuserid;
       var crossrefid;
       var crossoptnum;
       if(this.type=='cross'){
                var statusColumnName = this.$storage.get('statusColumnName');
                var statusColumnValue = this.$storage.get('statusColumnValue');
                if(statusColumnName!='') {
                        var obj = this.$storage.getObj('crossObj');
                       if(statusColumnName && !statusColumnName.startsWith("[")) {
                               for (var o in obj){
                                 if(o==statusColumnName){
                                   obj[o] = statusColumnValue;
                                 }
                               }
                               var table = this.$storage.get('crossTable');
                             this.$http({
                                 url: `${table}/update`,
                                 method: "post",
                                 data: obj
                               }).then(({ data }) => {});
                       } else {
                               crossuserid=this.$storage.get('userid');
                               crossrefid=obj['id'];
                               crossoptnum=this.$storage.get('statusColumnName');
                               crossoptnum=crossoptnum.replace(/\[/,"").replace(/\]/,"");
                        }
                }
        }
       this.$refs["ruleForm"].validate(valid => {
         if (valid) {
		 if(crossrefid && crossuserid) {
			 this.ruleForm.crossuserid = crossuserid;
			 this.ruleForm.crossrefid = crossrefid;
			let params = { 
				page: 1, 
				limit: 10, 
				crossuserid:this.ruleForm.crossuserid,
				crossrefid:this.ruleForm.crossrefid,
			} 
			this.$http({ 
				url: "yunshuxinxi/page", 
				method: "get", 
				params: params 
			}).then(({ 
				data 
			}) => { 
				if (data && data.code === 0) { 
				       if(data.data.total>=crossoptnum) {
					     this.$message.error(this.$storage.get('tips'));
					       return false;
				       } else {
					 this.$http({
					   url: `yunshuxinxi/${!this.ruleForm.id ? "save" : "update"}`,
					   method: "post",
					   data: this.ruleForm
					 }).then(({ data }) => {
					   if (data && data.code === 0) {
					     this.$message({
					       message: "操作成功",
					       type: "success",
					       duration: 1500,
					       onClose: () => {
						 this.parent.showFlag = true;
						 this.parent.addOrUpdateFlag = false;
						 this.parent.yunshuxinxiCrossAddOrUpdateFlag = false;
						 this.parent.search();
						 this.parent.contentStyleChange();
					       }
					     });
					   } else {
					     this.$message.error(data.msg);
					   }
					 });

				       }
				} else { 
				} 
			});
		 } else {
			 this.$http({
			   url: `yunshuxinxi/${!this.ruleForm.id ? "save" : "update"}`,
			   method: "post",
			   data: this.ruleForm
			 }).then(({ data }) => {
			   if (data && data.code === 0) {
			     this.$message({
			       message: "操作成功",
			       type: "success",
			       duration: 1500,
			       onClose: () => {
				 this.parent.showFlag = true;
				 this.parent.addOrUpdateFlag = false;
				 this.parent.yunshuxinxiCrossAddOrUpdateFlag = false;
				 this.parent.search();
				 this.parent.contentStyleChange();
			       }
			     });
			   } else {
			     this.$message.error(data.msg);
			   }
			 });
		 }
         }
       });
    },
    // 获取uuid
    getUUID () {
      return new Date().getTime();
    },
    // 返回
    back() {
      this.parent.showFlag = true;
      this.parent.addOrUpdateFlag = false;
      this.parent.yunshuxinxiCrossAddOrUpdateFlag = false;
      this.parent.contentStyleChange();
    },
    tupianUploadChange(fileUrls) {
	this.ruleForm.tupian = fileUrls;
    },
  }
};
</script>
<style lang="scss" scoped>
	.amap-wrapper {
		width: 100%;
		height: 500px;
	}
	
	.search-box {
		position: absolute;
	}
	
	.el-date-editor.el-input {
		width: auto;
	}
	
	.add-update-preview .el-form-item ::v-deep .el-form-item__label {
	  	  padding: 0 10px 0 0;
	  	  color: #666;
	  	  font-weight: 500;
	  	  width: 80px;
	  	  font-size: 14px;
	  	  line-height: 40px;
	  	  text-align: right;
	  	}
	
	.add-update-preview .el-form-item ::v-deep .el-form-item__content {
	  margin-left: 80px;
	}
	
	.add-update-preview .el-input ::v-deep .el-input__inner {
	  	  border: 1px solid #5497f2;
	  	  border-radius: 20px 40px;
	  	  padding: 0 12px;
	  	  box-shadow: 0 0 0px rgba(64, 158, 255, .5);
	  	  outline: none;
	  	  color: #bbbbbb;
	  	  width: 400px;
	  	  font-size: 14px;
	  	  height: 40px;
	  	}
	
	.add-update-preview .el-select ::v-deep .el-input__inner {
	  	  border: 1px solid #5497f2;
	  	  border-radius: 20px 40px;
	  	  padding: 0 10px;
	  	  box-shadow: 0 0 0px rgba(64, 158, 255, .5);
	  	  outline: none;
	  	  color: #bbb;
	  	  width: 200px;
	  	  font-size: 14px;
	  	  height: 40px;
	  	}
	
	.add-update-preview .el-date-editor ::v-deep .el-input__inner {
	  	  border: 1px solid #5497f2;
	  	  border-radius: 20px 40px;
	  	  padding: 0 10px 0 30px;
	  	  box-shadow: 0 0 0px rgba(64, 158, 255, .5);
	  	  outline: none;
	  	  color: #bbb;
	  	  width: 200px;
	  	  font-size: 14px;
	  	  height: 40px;
	  	}
	
	.add-update-preview ::v-deep .el-upload--picture-card {
		background: transparent;
		border: 0;
		border-radius: 0;
		width: auto;
		height: auto;
		line-height: initial;
		vertical-align: middle;
	}
	
	.add-update-preview ::v-deep .upload .upload-img {
	  	  border: 1px dashed rgba(64, 158, 255, 1);
	  	  cursor: pointer;
	  	  border-radius: 20px 40px;
	  	  color: rgba(64, 158, 255, 1);
	  	  width: 160px;
	  	  font-size: 32px;
	  	  line-height: 100px;
	  	  text-align: center;
	  	  height: 100px;
	  	}
	
	.add-update-preview ::v-deep .el-upload-list .el-upload-list__item {
	  	  border: 1px dashed rgba(64, 158, 255, 1);
	  	  cursor: pointer;
	  	  border-radius: 20px 40px;
	  	  color: rgba(64, 158, 255, 1);
	  	  width: 160px;
	  	  font-size: 32px;
	  	  line-height: 100px;
	  	  text-align: center;
	  	  height: 100px;
	  	}
	
	.add-update-preview ::v-deep .el-upload .el-icon-plus {
	  	  border: 1px dashed rgba(64, 158, 255, 1);
	  	  cursor: pointer;
	  	  border-radius: 20px 40px;
	  	  color: rgba(64, 158, 255, 1);
	  	  width: 160px;
	  	  font-size: 32px;
	  	  line-height: 100px;
	  	  text-align: center;
	  	  height: 100px;
	  	}
	
	.add-update-preview .el-textarea ::v-deep .el-textarea__inner {
	  	  border: 1px solid #5497f2;
	  	  border-radius: 20px 40px;
	  	  padding: 12px;
	  	  box-shadow: 0 0 0px rgba(64, 158, 255, .5);
	  	  outline: none;
	  	  color: #bbb;
	  	  width: 400px;
	  	  font-size: 14px;
	  	  height: auto;
	  	}
</style>
