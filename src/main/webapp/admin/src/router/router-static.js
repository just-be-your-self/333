import Vue from 'vue';
//配置路由
import VueRouter from 'vue-router'
Vue.use(VueRouter);
//1.创建组件
import Index from '@/views/index'
import Home from '@/views/home'
import Login from '@/views/login'
import NotFound from '@/views/404'
import UpdatePassword from '@/views/update-password'
import pay from '@/views/pay'
import register from '@/views/register'
import center from '@/views/center'
    import yunshucheci from '@/views/modules/yunshucheci/list'
    import yunshuxinxi from '@/views/modules/yunshuxinxi/list'
    import jiashiyuan from '@/views/modules/jiashiyuan/list'
    import jingbaojiemian from '@/views/modules/jingbaojiemian/list'
    import cheliangxinxi from '@/views/modules/cheliangxinxi/list'
    import weixianpinxinxi from '@/views/modules/weixianpinxinxi/list'
    import yingjiyuan from '@/views/modules/yingjiyuan/list'


//2.配置路由   注意：名字
const routes = [{
    path: '/index',
    name: '首页',
    component: Index,
    children: [{
      // 这里不设置值，是把main作为默认页面
      path: '/',
      name: '首页',
      component: Home,
      meta: {icon:'', title:'center'}
    }, {
      path: '/updatePassword',
      name: '修改密码',
      component: UpdatePassword,
      meta: {icon:'', title:'updatePassword'}
    }, {
      path: '/pay',
      name: '支付',
      component: pay,
      meta: {icon:'', title:'pay'}
    }, {
      path: '/center',
      name: '个人信息',
      component: center,
      meta: {icon:'', title:'center'}
    }
      ,{
	path: '/yunshucheci',
        name: '运输车次',
        component: yunshucheci
      }
      ,{
	path: '/yunshuxinxi',
        name: '运输信息',
        component: yunshuxinxi
      }
      ,{
	path: '/jiashiyuan',
        name: '驾驶员',
        component: jiashiyuan
      }
      ,{
	path: '/jingbaojiemian',
        name: '警报界面',
        component: jingbaojiemian
      }
      ,{
	path: '/cheliangxinxi',
        name: '车辆信息',
        component: cheliangxinxi
      }
      ,{
	path: '/weixianpinxinxi',
        name: '危险品信息',
        component: weixianpinxinxi
      }
      ,{
	path: '/yingjiyuan',
        name: '应急预案',
        component: yingjiyuan
      }
    ]
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
    meta: {icon:'', title:'login'}
  },
  {
    path: '/register',
    name: 'register',
    component: register,
    meta: {icon:'', title:'register'}
  },
  {
    path: '/',
    name: '首页',
    redirect: '/index'
  }, /*默认跳转路由*/
  {
    path: '*',
    component: NotFound
  }
]
//3.实例化VueRouter  注意：名字
const router = new VueRouter({
  mode: 'hash',
  /*hash模式改为history*/
  routes // （缩写）相当于 routes: routes
})
const originalPush = VueRouter.prototype.push
//修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
   return originalPush.call(this, location).catch(err => err)
}
export default router;
