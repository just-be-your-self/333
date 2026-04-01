<template>
	<div class="main-content">
		<!-- 列表页 -->
		<template v-if="showFlag">
			<el-form class="center-form-pv" :style='{"margin":"0 0 20px"}' :inline="true" :model="searchForm">
				<el-row :style='{"display":"block"}' >
					<div :style='{"margin":"0 10px 0 0","display":"inline-block"}'>
						<label :style='{"margin":"0 10px 0 0","color":"#666","display":"inline-block","lineHeight":"40px","fontSize":"14px","fontWeight":"500","height":"40px"}' class="item-label">车牌号</label>
						<el-input v-model="searchForm.chepaihao" placeholder="车牌号" clearable></el-input>
					</div>
					<div :style='{"margin":"0 10px 0 0","display":"inline-block"}' class="select">
						<label :style='{"margin":"0 10px 0 0","color":"#666","display":"inline-block","lineHeight":"40px","fontSize":"14px","fontWeight":"500","height":"40px"}' class="item-label">警报类型</label>
						<el-select clearable v-model="searchForm.jingleixing" placeholder="警报类型" @change="search">
							<el-option label="超速警报" value="超速警报"></el-option>
							<el-option label="偏离警报" value="偏离警报"></el-option>
						</el-select>
					</div>
					<div :style='{"margin":"0 10px 0 0","display":"inline-block"}' class="select">
						<label :style='{"margin":"0 10px 0 0","color":"#666","display":"inline-block","lineHeight":"40px","fontSize":"14px","fontWeight":"500","height":"40px"}' class="item-label">处理状态</label>
						<el-select clearable v-model="searchForm.sfsh" placeholder="处理状态" @change="search">
							<el-option label="待处理" value="待审核"></el-option>
							<el-option label="已处理" value="是"></el-option>
							<el-option label="已驳回" value="否"></el-option>
						</el-select>
					</div>
					<el-button :style='{"border":"0","cursor":"pointer","padding":"0 40px","outline":"none","color":"#fff","borderRadius":"20px 40px","background":"#333","width":"auto","fontSize":"14px","height":"40px"}' type="success" @click="search()">查询</el-button>
					<el-button :style='{"border":"1px solid #67C23A","cursor":"pointer","padding":"0 20px","margin":"0 10px 0 0","outline":"none","color":"#67C23A","borderRadius":"20px 40px","background":"#fff","width":"auto","fontSize":"14px","height":"40px"}' type="success" @click="refreshData()">刷新</el-button>
					<el-switch
					  v-model="autoRefresh"
					  active-text="自动刷新"
					  inactive-text="停止刷新"
					  :style='{"display":"inline-block","margin":"0 0 0 10px"}'>
					</el-switch>
				</el-row>

				<el-row :style='{"margin":"20px 0","display":"flex"}'>
					<el-button :style='{"border":"0","cursor":"pointer","padding":"0 24px","margin":"0 10px 0 5px","outline":"none","color":"#fff","borderRadius":"20px 40px","background":"rgba(255, 0, 0, 1)","width":"auto","fontSize":"14px","height":"40px"}' v-if="isAuth('jingbaojiemian','删除')" :disabled="dataListSelections.length <= 0" type="danger" @click="deleteHandler()">删除</el-button>
					<span :style='{"margin":"0 0 0 10px","color":"#999","lineHeight":"40px"}'>共 {{totalPage}} 条警报记录</span>
				</el-row>
			</el-form>
			
			<!-- <div> -->
				<el-table class="tables"
					:stripe='false'
					:style='{"padding":"0","borderColor":"#e5e5e5","borderRadius":"20px  20px","borderWidth":"1px 0 0 1px","background":"#fff","width":"100%","borderStyle":"solid"}' 
					v-if="isAuth('jingbaojiemian','查看')"
					:data="dataList"
					v-loading="dataListLoading"
				@selection-change="selectionChangeHandler">
					<el-table-column :resizable='true' type="selection" align="center" width="50"></el-table-column>
					<el-table-column :resizable='true' :sortable='false' label="索引" type="index" width="50" />
					<el-table-column :resizable='true' :sortable='false'
						prop="biaoti"
					label="警报标题">
						<template slot-scope="scope">
							{{scope.row.biaoti}}
						</template>
					</el-table-column>
					<el-table-column :resizable='true' :sortable='false'
						prop="jingbaoyuanyin"
					label="警报原因">
						<template slot-scope="scope">
							{{scope.row.jingbaoyuanyin}}
						</template>
					</el-table-column>
					<el-table-column :resizable='true' :sortable='false'
						prop="chepaihao"
					label="车牌号">
						<template slot-scope="scope">
							{{scope.row.chepaihao}}
						</template>
					</el-table-column>
					<el-table-column :resizable='true' :sortable='false'
						prop="xingming"
					label="驾驶员">
						<template slot-scope="scope">
							{{scope.row.xingming}}
						</template>
					</el-table-column>
					<el-table-column :resizable='true' :sortable='false'
						prop="weizhi"
					label="位置">
						<template slot-scope="scope">
							{{scope.row.weizhi}}
						</template>
					</el-table-column>
					<el-table-column :resizable='true' :sortable='false'
						prop="sudu"
					label="速度">
						<template slot-scope="scope">
							{{scope.row.sudu}}
						</template>
					</el-table-column>
					<el-table-column :resizable='true' :sortable='false'
						prop="jingbaoshijian"
					label="警报时间">
						<template slot-scope="scope">
							{{scope.row.jingbaoshijian}}
						</template>
					</el-table-column>
					<el-table-column :resizable='true' :sortable='false' prop="sfsh" label="处理状态">
						<template slot-scope="scope">
							<span style="margin-right:10px" v-if="scope.row.sfsh=='是' || scope.row.sfsh=='通过'">已处理</span>
							<span style="margin-right:10px" v-if="scope.row.sfsh=='否'">已驳回</span>
							<span style="margin-right:10px;color:#E6A23C;font-weight:bold;" v-if="scope.row.sfsh=='待审核'">待处理</span>
						</template>
					</el-table-column>
					<el-table-column :resizable='true' :sortable='false' prop="shhf" label="处理备注"></el-table-column>
					<el-table-column :resizable='true' :sortable='false' v-if="isAuth('jingbaojiemian','审核')" prop="sfsh" label="处理">
						<template slot-scope="scope">
							<el-button  type="text" size="small" @click="shDialog(scope.row)">处理</el-button>
						</template>
					</el-table-column>
					<el-table-column width="300" label="操作">
						<template slot-scope="scope">
							<el-button :style='{"border":"2px solid #67C23A","cursor":"pointer","padding":"0 10px","margin":"3px 6px 3px 0","outline":"none","color":"#67C23A","borderRadius":"10px 3px","background":"#edf7e7","width":"auto","fontSize":"14px","height":"32px"}' v-if=" isAuth('jingbaojiemian','查看')" type="success" size="mini" @click="addOrUpdateHandler(scope.row.id,'info')">详情</el-button>
							<el-button :style='{"border":"2px solid #4a8be2","cursor":"pointer","padding":"0 10px","margin":"3px 6px 3px 0","outline":"none","color":"#2774dc","borderRadius":"10px 3px","background":"#e7eef7","width":"auto","fontSize":"14px","height":"32px"}' v-if=" isAuth('jingbaojiemian','修改')" type="primary" size="mini" @click="addOrUpdateHandler(scope.row.id)">修改</el-button>





							<el-button :style='{"border":"2px solid #dd3a3a","cursor":"pointer","padding":"0 10px","margin":"3px 10px 3px 0","outline":"none","color":"#dd3a3a","borderRadius":"10px 6px","background":"#f7e7e7","width":"auto","fontSize":"14px","height":"32px"}' v-if="isAuth('jingbaojiemian','删除') " type="danger" size="mini" @click="deleteHandler(scope.row.id)">删除</el-button>
						</template>
					</el-table-column>
				</el-table>
				<el-pagination
					@size-change="sizeChangeHandle"
					@current-change="currentChangeHandle"
					:current-page="pageIndex"
					background
					:page-sizes="[10, 20, 30, 50]"
					:page-size="pageSize"
					:layout="layouts.join()"
					:total="totalPage"
					prev-text="上一页"
					next-text="下一页"
					:hide-on-single-page="true"
					:style='{"width":"100%","padding":"0","margin":"20px 0 0","whiteSpace":"nowrap","color":"#333","fontWeight":"500"}'
				></el-pagination>
			<!-- </div> -->
		</template>
		
		<!-- 添加/修改页面  将父组件的search方法传递给子组件-->
		<add-or-update v-if="addOrUpdateFlag" :parent="this" ref="addOrUpdate"></add-or-update>


		<el-dialog title="处理警报" :visible.sync="sfshVisiable" width="60%">
			<el-form ref="form" :model="shForm" label-width="100px">
				<el-row>
					<el-col :span="12">
						<el-form-item label="警报标题">
							<el-input v-model="shForm.biaoti" readonly></el-input>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="车牌号">
							<el-input v-model="shForm.chepaihao" readonly></el-input>
						</el-form-item>
					</el-col>
				</el-row>
				<el-row>
					<el-col :span="12">
						<el-form-item label="警报原因">
							<el-input v-model="shForm.jingbaoyuanyin" readonly type="textarea"></el-input>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="位置">
							<el-input v-model="shForm.weizhi" readonly></el-input>
						</el-form-item>
					</el-col>
				</el-row>
				<el-row>
					<el-col :span="12">
						<el-form-item label="速度">
							<el-input v-model="shForm.sudu" readonly></el-input>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="警报时间">
							<el-input v-model="shForm.jingbaoshijian" readonly></el-input>
						</el-form-item>
					</el-col>
				</el-row>
				<el-row>
					<el-col :span="12">
						<el-form-item label="驾驶员">
							<el-input v-model="shForm.xingming" readonly></el-input>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="处理状态">
							<el-select v-model="shForm.sfsh" placeholder="处理状态">
								<el-option label="已处理" value="是"></el-option>
								<el-option label="已驳回" value="否"></el-option>
								<el-option label="待处理" value="待审核"></el-option>
							</el-select>
						</el-form-item>
					</el-col>
				</el-row>
				<el-form-item label="处理备注">
					<el-input type="textarea" :rows="4" v-model="shForm.shhf" placeholder="请输入处理备注"></el-input>
				</el-form-item>
			</el-form>
			<span slot="footer" class="dialog-footer">
				<el-button @click="sfshVisiable = false">取 消</el-button>
				<el-button type="primary" @click="shHandler">确 定</el-button>
			</span>
		</el-dialog>



	</div>
</template>

<script>
import axios from 'axios'
import AddOrUpdate from "./add-or-update";
export default {
  data() {
    return {
      searchForm: {
        key: "",
        jingleixing: "",
        chepaihao: "",
        sfsh: ""
      },
      form:{},
      dataList: [],
      pageIndex: 1,
      pageSize: 10,
      totalPage: 0,
      dataListLoading: false,
      dataListSelections: [],
      showFlag: true,
      sfshVisiable: false,
      shForm: {},
      chartVisiable: false,
      chartVisiable1: false,
      chartVisiable2: false,
      chartVisiable3: false,
      chartVisiable4: false,
      chartVisiable5: false,
      addOrUpdateFlag:false,
      layouts: ["total","prev","pager","next","sizes","jumper"],
      // 自动刷新定时器
      refreshTimer: null,
      autoRefresh: true,


    };
  },
  created() {
    this.init();
    this.getDataList();
    this.contentStyleChange()
  },
  mounted() {
    // 启动自动刷新，每5秒刷新一次
    this.startAutoRefresh()
  },
  beforeDestroy() {
    // 组件销毁时停止刷新
    this.stopAutoRefresh()
  },
  filters: {
    htmlfilter: function (val) {
      return val.replace(/<[^>]*>/g).replace(/undefined/g,'');
    }
  },
  components: {
    AddOrUpdate,
  },
  methods: {

    // 启动自动刷新
    startAutoRefresh() {
      if (this.refreshTimer) return
      this.refreshTimer = setInterval(() => {
        if (this.autoRefresh && this.pageIndex === 1) {
          this.getDataList()
        }
      }, 5000) // 每5秒刷新一次
    },

    // 停止自动刷新
    stopAutoRefresh() {
      if (this.refreshTimer) {
        clearInterval(this.refreshTimer)
        this.refreshTimer = null
      }
    },

    // 手动刷新
    refreshData() {
      this.getDataList()
    },

    contentStyleChange() {
      this.contentPageStyleChange()
    },
    // 分页
    contentPageStyleChange(){
      let arr = []

      // if(this.contents.pageTotal) arr.push('total')
      // if(this.contents.pageSizes) arr.push('sizes')
      // if(this.contents.pagePrevNext){
      //   arr.push('prev')
      //   if(this.contents.pagePager) arr.push('pager')
      //   arr.push('next')
      // }
      // if(this.contents.pageJumper) arr.push('jumper')
      // this.layouts = arr.join()
      // this.contents.pageEachNum = 10
    },








    init () {
        this.sfshOptions = "是,否,待审核".split(',');
    },
    // 警报类型选择变化
    jingleixingChange() {
      this.search()
    },
    search() {
      this.pageIndex = 1;
      this.getDataList();
    },

    // 获取数据列表
    getDataList() {
      this.dataListLoading = true;
      let params = {
        page: this.pageIndex,
        limit: this.pageSize,
        sort: 'id',
        order: 'desc',
      }
      if(this.searchForm.chepaihao != '' && this.searchForm.chepaihao != undefined){
        params['chepaihao'] = '%' + this.searchForm.chepaihao + '%'
      }
      if(this.searchForm.jingleixing != '' && this.searchForm.jingleixing != undefined){
        params['jingleixing'] = this.searchForm.jingleixing
      }
      if(this.searchForm.sfsh != '' && this.searchForm.sfsh != undefined){
        params['sfsh'] = this.searchForm.sfsh
      }
      this.$http({
        url: "jingbaojiemian/page",
        method: "get",
        params: params
      }).then(({ data }) => {
        if (data && data.code === 0) {
          this.dataList = data.data.list;
          this.totalPage = data.data.total;
        } else {
          this.dataList = [];
          this.totalPage = 0;
        }
        this.dataListLoading = false;
      });
    },
    // 每页数
    sizeChangeHandle(val) {
      this.pageSize = val;
      this.pageIndex = 1;
      this.getDataList();
    },
    // 当前页
    currentChangeHandle(val) {
      this.pageIndex = val;
      this.getDataList();
    },
    // 多选
    selectionChangeHandler(val) {
      this.dataListSelections = val;
    },
    // 添加/修改
    addOrUpdateHandler(id,type) {
      this.showFlag = false;
      this.addOrUpdateFlag = true;
      this.crossAddOrUpdateFlag = false;
      if(type!='info'){
        type = 'else';
      }
      this.$nextTick(() => {
        this.$refs.addOrUpdate.init(id,type);
      });
    },
    // 审核窗口
    shDialog(row){
      this.sfshVisiable = !this.sfshVisiable;
      if(row){
        this.shForm = {
          biaoti: row.biaoti,
          jingleixing: row.jingleixing,
          chepaihao: row.chepaihao,
          xingming: row.xingming,
          jingbaoyuanyin: row.jingbaoyuanyin,
          weizhi: row.weizhi,
          sudu: row.sudu,
          jingbaoshijian: row.jingbaoshijian,
          sfsh: row.sfsh,
          shhf: row.shhf,
          id: row.id
        }
      }
    },
    // 审核
    shHandler(){
      this.$confirm(`确定操作?`, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        this.$http({
          url: "jingbaojiemian/update",
          method: "post",
          data: this.shForm
        }).then(({ data }) => {
          if (data && data.code === 0) {
            this.$message({
              message: "操作成功",
              type: "success",
              duration: 1500,
              onClose: () => {
                this.getDataList();
                this.shDialog()
              }
            });
          } else {
            this.$message.error(data.msg);
          }
        });
      });
    },
    // 下载
    download(file){
      window.open(`${file}`)
    },
    // 删除
    deleteHandler(id) {
      var ids = id
        ? [Number(id)]
        : this.dataListSelections.map(item => {
            return Number(item.id);
          });
      this.$confirm(`确定进行[${id ? "删除" : "批量删除"}]操作?`, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        this.$http({
          url: "jingbaojiemian/delete",
          method: "post",
          data: ids
        }).then(({ data }) => {
          if (data && data.code === 0) {
            this.$message({
              message: "操作成功",
              type: "success",
              duration: 1500,
              onClose: () => {
                this.search();
              }
            });
          } else {
            this.$message.error(data.msg);
          }
        });
      });
    },


  }

};
</script>
<style lang="scss" scoped>
	
	.center-form-pv {
	  .el-date-editor.el-input {
	    width: auto;
	  }
	}
	
	.el-input {
	  width: auto;
	}
	
	// form
	.center-form-pv .el-input ::v-deep .el-input__inner {
				border: 1px solid #e5e5e5;
				border-radius: 20px 40px;
				padding: 0 12px;
				box-shadow: 0 0 0px rgba(64, 158, 255, .5);
				outline: none;
				color: #999999;
				width: 170px;
				font-size: 14px;
				height: 40px;
			}
	
	.center-form-pv .el-select ::v-deep .el-input__inner {
				border: 1px solid #e5e5e5;
				border-radius: 20px 40px;
				padding: 0 10px;
				box-shadow: 0 0 0px rgba(64, 158, 255, .5);
				outline: none;
				color: #999999;
				width: 170px;
				font-size: 14px;
				height: 40px;
			}
	
	.center-form-pv .el-date-editor ::v-deep .el-input__inner {
				border: 1px solid #e5e5e5;
				border-radius: 20px 40px;
				padding: 0 10px 0 30px;
				box-shadow: 0 0 0px rgba(64, 158, 255, .5);
				outline: none;
				color: #999999;
				width: 170px;
				font-size: 14px;
				height: 40px;
			}
	
	// table
	.el-table ::v-deep .el-table__header-wrapper thead {
				color: #555;
				font-weight: 500;
				width: 100%;
			}
	
	.el-table ::v-deep .el-table__header-wrapper thead tr {
				background: #fff;
			}
	
	.el-table ::v-deep .el-table__header-wrapper thead tr th {
				padding: 12px 0;
				color: #fff;
				background: -webkit-linear-gradient(top,#4fa3e9,#3d79cf);
				border-color: #e5e5e5;
				border-width: 0 1px 1px 0;
				border-style: solid;
				text-align: left;
			}

	.el-table ::v-deep .el-table__header-wrapper thead tr th .cell {
				padding: 0 10px;
				word-wrap: normal;
				word-break: break-all;
				white-space: normal;
				font-weight: bold;
				display: inline-block;
				vertical-align: middle;
				width: 100%;
				line-height: 24px;
				position: relative;
				text-overflow: ellipsis;
			}

	
	.el-table ::v-deep .el-table__body-wrapper tbody {
				width: 100%;
			}

	.el-table ::v-deep .el-table__body-wrapper tbody tr {
				background: #fff;
			}
	
	.el-table ::v-deep .el-table__body-wrapper tbody tr td {
				padding: 12px 0;
				color: #555;
				background: #fff;
				border-color: #eee;
				border-width: 0 1px 1px 0;
				border-style: solid;
				text-align: left;
			}
	
		
	.el-table ::v-deep .el-table__body-wrapper tbody tr:hover td {
				padding: 12px 0;
				color: #555555;
				background: #f7f7f7;
				border-color: #eee;
				border-width: 0 1px 1px 0;
				border-style: solid;
				text-align: left;
			}
	
	.el-table ::v-deep .el-table__body-wrapper tbody tr td {
				padding: 12px 0;
				color: #555;
				background: #fff;
				border-color: #eee;
				border-width: 0 1px 1px 0;
				border-style: solid;
				text-align: left;
			}

	.el-table ::v-deep .el-table__body-wrapper tbody tr td .cell {
				padding: 0 10px;
				overflow: hidden;
				word-break: break-all;
				white-space: normal;
				line-height: 24px;
				text-overflow: ellipsis;
			}
	
	// pagination
	.main-content .el-pagination ::v-deep .el-pagination__total {
				margin: 0 10px 0 0;
				color: #666;
				font-weight: 400;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				height: 28px;
			}
	
	.main-content .el-pagination ::v-deep .btn-prev {
				border: none;
				border-radius: 2px;
				padding: 0 5px;
				margin: 0 5px;
				color: #666;
				background: #f4f4f5;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				min-width: 35px;
				height: 28px;
			}
	
	.main-content .el-pagination ::v-deep .btn-next {
				border: none;
				border-radius: 2px;
				padding: 0 5px;
				margin: 0 5px;
				color: #666;
				background: #f4f4f5;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				min-width: 35px;
				height: 28px;
			}
	
	.main-content .el-pagination ::v-deep .btn-prev:disabled {
				border: none;
				cursor: not-allowed;
				border-radius: 4px 8px;
				padding: 0 5px;
				margin: 0 5px;
				color: #C0C4CC;
				background: #f4f4f5;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				height: 28px;
			}
	
	.main-content .el-pagination ::v-deep .btn-next:disabled {
				border: none;
				cursor: not-allowed;
				border-radius: 4px 8px;
				padding: 0 5px;
				margin: 0 5px;
				color: #C0C4CC;
				background: #f4f4f5;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				height: 28px;
			}

	.main-content .el-pagination ::v-deep .el-pager {
				padding: 0;
				margin: 0;
				display: inline-block;
				vertical-align: top;
			}

	.main-content .el-pagination ::v-deep .el-pager .number {
				cursor: pointer;
				padding: 0 4px;
				margin: 0 5px;
				color: #666;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				border-radius: 4px 8px;
				background: #fff;
				text-align: center;
				min-width: 30px;
				height: 28px;
			}
	
	.main-content .el-pagination ::v-deep .el-pager .number:hover {
				cursor: pointer;
				padding: 0 4px;
				margin: 0 5px;
				color: #fff;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				border-radius: 4px 8px;
				background: #5497f2;
				text-align: center;
				min-width: 30px;
				height: 28px;
			}
	
	.main-content .el-pagination ::v-deep .el-pager .number.active {
				cursor: default;
				padding: 0 4px;
				margin: 0 5px;
				color: #fff;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				border-radius: 4px 8px;
				background: #5497f2;
				text-align: center;
				min-width: 30px;
				height: 28px;
			}
	
	.main-content .el-pagination ::v-deep .el-pagination__sizes {
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				height: 28px;
			}
	
	.main-content .el-pagination ::v-deep .el-pagination__sizes .el-input {
				margin: 0 5px;
				width: 100px;
				position: relative;
			}
	
	.main-content .el-pagination ::v-deep .el-pagination__sizes .el-input .el-input__inner {
				border: 1px solid #DCDFE6;
				cursor: pointer;
				padding: 0 25px 0 8px;
				color: #606266;
				display: inline-block;
				font-size: 13px;
				line-height: 28px;
				border-radius: 8px 16px;
				outline: 0;
				background: #FFF;
				width: 100%;
				text-align: center;
				height: 28px;
			}
	
	.main-content .el-pagination ::v-deep .el-pagination__sizes .el-input span.el-input__suffix {
				top: 0;
				position: absolute;
				right: 0;
				height: 100%;
			}
	
	.main-content .el-pagination ::v-deep .el-pagination__sizes .el-input .el-input__suffix .el-select__caret {
				cursor: pointer;
				color: #C0C4CC;
				width: 25px;
				font-size: 14px;
				line-height: 28px;
				text-align: center;
			}
	
	.main-content .el-pagination ::v-deep .el-pagination__jump {
				margin: 0 0 0 24px;
				color: #606266;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				height: 28px;
			}
	
	.main-content .el-pagination ::v-deep .el-pagination__jump .el-input {
				border-radius: 3px;
				padding: 0 2px;
				margin: 0 5px;
				display: inline-block;
				width: 50px;
				font-size: 14px;
				line-height: 18px;
				position: relative;
				text-align: center;
				height: 28px;
			}
	
	.main-content .el-pagination ::v-deep .el-pagination__jump .el-input .el-input__inner {
				border: 1px solid #DCDFE6;
				cursor: pointer;
				padding: 0 3px;
				color: #606266;
				display: inline-block;
				font-size: 14px;
				line-height: 28px;
				border-radius: 8px 16px;
				outline: 0;
				background: #FFF;
				width: 100%;
				text-align: center;
				height: 28px;
			}
</style>
