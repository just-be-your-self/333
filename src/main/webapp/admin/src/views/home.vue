<template>
<div class="content">
	<div class="text" :style='{"margin":"50px auto","fontSize":"34px","color":"rgb(51, 51, 51)","textAlign":"center","fontWeight":"bold"}'>欢迎使用 {{this.$project.projectName}}</div>
    <div class="cardView">
        <div class="cards" :style='{"margin":"0 0 20px 0","alignItems":"center","justifyContent":"center","display":"flex"}'>
			<div :style='{"border":"1px solid #ccc","boxShadow":"0 0px 0px rgba(0,0,0,.3)","margin":"0 10px","borderRadius":"20px 40px","display":"flex"}' v-if="isAuth('yunshuxinxi','首页总数')">
				<div :style='{"width":"180px","borderRadius":"20px 40px","background":"#5497f2","height":"120px"}'></div>
				<div :style='{"width":"160px","alignItems":"center","flexDirection":"column","justifyContent":"center","display":"flex","height":"120px"}'>
					<div :style='{"margin":"5px 0","lineHeight":"24px","fontSize":"34px","color":"#888","fontWeight":"bold","height":"24px"}'>{{yunshuxinxiCount}}</div>
					<div :style='{"margin":"10px 0","lineHeight":"24px","fontSize":"16px","color":"#666","height":"24px"}'>运输信息总数</div>
				</div>
			</div>
        </div>
        <div style="display: flex;align-items: center;width: 100%;margin-bottom: 10px;">
            <el-card style="width: 50%;margin: 0 10px;" v-if="isAuth('yunshuxinxi','首页统计')">
                <div id="yunshuxinxiChart1" style="width:100%;height:400px;"></div>
            </el-card>
            <el-card style="width: 50%;margin: 0 10px;" v-if="isAuth('yunshuxinxi','首页统计')">
                <div id="yunshuxinxiChart2" style="width:100%;height:400px;"></div>
            </el-card>
        </div>
    </div>
</div>
</template>
<script>
//2
import router from '@/router/router-static'
export default {
	data() {
		return {
            yunshuxinxiCount: 0,
		};
	},
  mounted(){
    this.init();
    this.getyunshuxinxiCount();
    this.yunshuxinxiChat1();
    this.yunshuxinxiChat2();
  },
  methods:{
    init(){
        if(this.$storage.get('Token')){
        this.$http({
            url: `${this.$storage.get('sessionTable')}/session`,
            method: "get"
        }).then(({ data }) => {
            if (data && data.code != 0) {
            router.push({ name: 'login' })
            }
        });
        }else{
            router.push({ name: 'login' })
        }
    },
    getyunshuxinxiCount() {
        this.$http({
            url: `yunshuxinxi/count`,
            method: "get"
        }).then(({
            data
        }) => {
            if (data && data.code == 0) {
                this.yunshuxinxiCount = data.data
            }
        })
    },

    yunshuxinxiChat1() {
      this.$nextTick(()=>{
        //  shuliang
        // zhongdian zhongdian

        var yunshuxinxiChart1 = this.$echarts.init(document.getElementById("yunshuxinxiChart1"),'macarons');
        this.$http({
            url: `yunshuxinxi/value/zhongdian/shuliang`,
            method: "get",
        }).then(({ data }) => {
            if (data && data.code === 0) {
                let res = data.data;
                let xAxis = [];
                let yAxis = [];
                let pArray = []
                for(let i=0;i<res.length;i++){
                    xAxis.push(res[i].zhongdian);
                    yAxis.push(parseFloat((res[i].total)));
                    pArray.push({
                        value: parseFloat((res[i].total)),
                        name: res[i].zhongdian
                    })
                }
                var option = {};
                option = {
                    title: {
                        text: '终点统计',
                        left: 'center'
                    },
                    tooltip: {
                      trigger: 'item',
                      formatter: '{b} : {c}'
                    },
                    xAxis: {
                        type: 'category',
                        data: xAxis
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [{
                        data: yAxis,
                        type: 'bar'
                    }]
                };
                // 使用刚指定的配置项和数据显示图表。
                yunshuxinxiChart1.setOption(option);
                  //根据窗口的大小变动图表
                window.onresize = function() {
                    yunshuxinxiChart1.resize();
                };
            }
        });
      })
    },

    yunshuxinxiChat2() {
      this.$nextTick(()=>{
        //  shuliang
        // xingming xingming

        var yunshuxinxiChart2 = this.$echarts.init(document.getElementById("yunshuxinxiChart2"),'macarons');
        this.$http({
            url: `yunshuxinxi/value/xingming/shuliang`,
            method: "get",
        }).then(({ data }) => {
            if (data && data.code === 0) {
                let res = data.data;
                let xAxis = [];
                let yAxis = [];
                let pArray = []
                for(let i=0;i<res.length;i++){
                    xAxis.push(res[i].xingming);
                    yAxis.push(parseFloat((res[i].total)));
                    pArray.push({
                        value: parseFloat((res[i].total)),
                        name: res[i].xingming
                    })
                }
                var option = {};
                option = {
                    title: {
                        text: '驾驶员统计',
                        left: 'center'
                    },
                    tooltip: {
                      trigger: 'item',
                      formatter: '{b} : {c}'
                    },
                    xAxis: {
                        type: 'category',
                        data: xAxis
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [{
                        data: yAxis,
                        type: 'bar'
                    }]
                };
                // 使用刚指定的配置项和数据显示图表。
                yunshuxinxiChart2.setOption(option);
                  //根据窗口的大小变动图表
                window.onresize = function() {
                    yunshuxinxiChart2.resize();
                };
            }
        });
      })
    },





  }
};
</script>
<style lang="scss" scoped>
    .cardView {
        display: flex;
        flex-wrap: wrap;
        width: 100%;

        .cards {
            display: flex;
            align-items: center;
            width: 100%;
            margin-bottom: 10px;
            justify-content: center;
            .card {
                width: calc(25% - 20px);
                margin: 0 10px;
                ::v-deep.el-card__body{
                    padding: 0;
                }
            }
        }
    }
</style>
