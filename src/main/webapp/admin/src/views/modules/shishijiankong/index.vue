<template>
  <div class="main-content">
    <div class="monitor-container">
      <!-- 顶部搜索栏 -->
      <div class="search-bar">
        <el-form :inline="true" :model="searchForm" class="search-form">
          <el-form-item label="车牌号">
            <el-input
              v-model="searchForm.chepaihao"
              placeholder="请输入车牌号"
              clearable
              @keyup.enter.native="searchVehicle"
            >
              <i slot="prefix" class="el-icon-search"></i>
            </el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="searchVehicle" icon="el-icon-search">查询</el-button>
            <el-button @click="resetSearch">重置</el-button>
            <el-button type="success" @click="startSimulation" :disabled="isSimulating" icon="el-icon-video-play">
              {{ isSimulating ? '模拟中...' : '开始模拟' }}
            </el-button>
            <el-button type="warning" @click="stopSimulation" :disabled="!isSimulating" icon="el-icon-video-pause">
              停止模拟
            </el-button>
          </el-form-item>
        </el-form>
      </div>

      <!-- 监控内容区 -->
      <div class="monitor-content">
        <!-- 左侧车辆列表 -->
        <div class="vehicle-list">
          <div class="list-header">
            <span>车辆列表</span>
            <span class="count">共 {{vehicleList.length}} 辆</span>
          </div>
          <el-scrollbar class="vehicle-scrollbar">
            <div
              v-for="vehicle in vehicleList"
              :key="vehicle.id"
              class="vehicle-item"
              :class="{
                'selected': selectedVehicle && selectedVehicle.id === vehicle.id,
                'warning': hasWarning(vehicle.id),
                'arrived': vehicle.zhuangtai === '已完成'
              }"
              @click="selectVehicle(vehicle)"
            >
              <div class="vehicle-icon">
                <i class="el-icon-truck"></i>
                <span v-if="hasWarning(vehicle.id)" class="warning-badge">!</span>
                <span v-if="vehicle.zhuangtai === '已完成'" class="finish-badge">✓</span>
              </div>
              <div class="vehicle-info">
                <div class="vehicle-plate">{{ vehicle.chepaihao }}</div>
                <div class="vehicle-status">
                  <span class="status-dot" :class="getStatusClass(vehicle.zhuangtai)"></span>
                  <span>{{ vehicle.zhuangtai || '在线' }}</span>
                </div>
                <div class="vehicle-route">
                  <span class="route-text">{{ vehicle.qidian || '起点' }} → {{ vehicle.zhongdian || '终点' }}</span>
                </div>
              </div>
            </div>
            <div v-if="vehicleList.length === 0" class="empty-list">
              <i class="el-icon-folder-opened"></i>
              <p>暂无车辆数据</p>
              <p class="tip">请先在运输信息中添加数据</p>
            </div>
          </el-scrollbar>
        </div>

        <!-- 中间地图区域 -->
        <div class="map-container">
          <div class="map-header">
            <span>车辆位置监控</span>
            <div class="header-right">
              <span class="sim-status" v-if="isSimulating">
                <i class="el-icon-loading"></i> 模拟运行中
              </span>
              <span class="sim-status arrive" v-if="isArrived">
                <i class="el-icon-check"></i> 已到达终点
              </span>
              <el-button size="mini" type="primary" @click="locateVehicle" icon="el-icon-location">定位车辆</el-button>
            </div>
          </div>

          <!-- 地图容器 -->
          <div id="amapContainer" class="map-wrapper"></div>

          <!-- 模拟状态指示器 -->
          <div class="simulation-indicator" v-if="isSimulating && !isArrived">
            <div class="sim-info">
              <i class="el-icon-truck"></i>
              <span>{{ selectedVehicle ? selectedVehicle.chepaihao : '' }}</span>
              <span class="sim-speed" :class="{'speed-high': currentSpeed > speedLimit}">{{ currentSpeed }} km/h</span>
            </div>
          </div>

          <!-- 地图信息覆盖层 -->
          <div class="map-overlay" v-if="selectedVehicle">
            <div class="overlay-title">
              {{ selectedVehicle.chepaihao }}
              <span v-if="isArrived" class="arrive-tag">运输完成!</span>
              <span v-else-if="currentSpeedWarning" class="speed-warning-tag">超速!</span>
              <span v-else-if="deviationWarning" class="deviation-warning-tag">偏离!</span>
            </div>
            <div class="overlay-info">
              <div class="info-row">
                <span class="label">运输路线：</span>
                <span class="value">{{ selectedVehicle.qidian || '起点' }} → {{ selectedVehicle.zhongdian || '终点' }}</span>
              </div>
              <div class="info-row">
                <span class="label">当前位置：</span>
                <span class="value">{{ isArrived ? (selectedVehicle.zhongdian || '终点') : (currentAddress || '起点附近') }}</span>
              </div>
              <div class="info-row">
                <span class="label">经度：</span>
                <span class="value">{{ isArrived ? endLng.toFixed(6) : currentLng.toFixed(6) }}</span>
              </div>
              <div class="info-row">
                <span class="label">纬度：</span>
                <span class="value">{{ isArrived ? endLat.toFixed(6) : currentLat.toFixed(6) }}</span>
              </div>
              <div class="info-row">
                <span class="label">当前速度：</span>
                <span class="value" :class="{'speed-red': currentSpeedWarning}">{{ currentSpeed }} km/h</span>
              </div>
              <div class="info-row">
                <span class="label">速度限制：</span>
                <span class="value">{{ speedLimit }} km/h</span>
              </div>
              <div class="info-row">
                <span class="label">偏离距离：</span>
                <span class="value" :class="{'speed-red': deviationWarning}">{{ deviationDistance.toFixed(2) }} km</span>
              </div>
              <div class="info-row">
                <span class="label">危险品：</span>
                <span class="value">{{ selectedVehicle.weixianpinmingcheng || '未分类' }}</span>
              </div>
              <div class="info-row">
                <span class="label">驾驶员：</span>
                <span class="value">{{ selectedVehicle.xingming || '未知' }}</span>
              </div>
              <div class="progress-bar">
                <span class="progress-label">{{ isArrived ? '运输进度: 100% (已完成)' : '运输进度: ' + progressPercent + '%' }}</span>
                <el-progress :percentage="progressPercent" :stroke-width="10" :color="progressColor"></el-progress>
              </div>
            </div>
          </div>

          <!-- 预警信息面板 -->
          <div class="warning-panel" v-if="warningList.length > 0">
            <div class="warning-header">
              <i class="el-icon-warning"></i>
              <span>预警信息</span>
              <span class="warning-count">{{ warningList.length }}</span>
              <el-button type="text" style="margin-left: auto; color: #fff;" @click="warningList = []">清除</el-button>
            </div>
            <div class="warning-list">
              <div v-for="(warning, index) in warningList.slice(0, 5)" :key="index" class="warning-item" :class="warning.type">
                <span class="warning-time">{{ warning.time }}</span>
                <span class="warning-msg">{{ warning.message }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Shishijiankong',
  data() {
    return {
      searchForm: {
        chepaihao: ''
      },
      vehicleList: [],
      selectedVehicle: null,
      map: null,
      marker: null,
      polyline: null,
      passedPolyline: null,
      startMarker: null,
      endMarker: null,
      geocoder: null,
      isSimulating: false,
      isArrived: false,
      simulationTimer: null,
      // 起点坐标
      startLng: 116.397428,
      startLat: 39.90923,
      // 终点坐标
      endLng: 116.55,
      endLat: 39.75,
      // 当前坐标
      currentLng: 116.397428,
      currentLat: 39.90923,
      currentSpeed: 0,
      currentAddress: '',
      // 模拟进度
      progressPercent: 0,
      // 预警相关
      speedLimit: 80,
      deviationThreshold: 0.5,
      deviationDistance: 0,
      speedWarning: false,
      deviationWarning: false,
      warningList: [],
      vehicleWarnings: {},
      hasWarningTriggered: false, // 一次模拟最多一条预警
      mapReady: false,
      // 路线点
      routePoints: [],
      currentPointIndex: 0,
      totalPoints: 100
    }
  },
  computed: {
    currentSpeedWarning() {
      return this.currentSpeed > this.speedLimit
    },
    hasWarning() {
      return (vehicleId) => {
        const warning = this.vehicleWarnings[vehicleId]
        return warning && (warning.speed || warning.deviation)
      }
    },
    progressColor() {
      if (this.isArrived) return '#909399'
      if (this.deviationWarning) return '#e6a23c'
      if (this.currentSpeedWarning) return '#f56c6c'
      return '#67c23a'
    }
  },
  mounted() {
    this.$nextTick(() => {
      this.waitForAMap()
    })
  },
  beforeDestroy() {
    this.stopSimulation()
    if (this.map) {
      this.map.destroy()
    }
  },
  methods: {
    getStatusClass(status) {
      if (status === '已完成') return 'finish'
      if (status === '运输中') return 'online'
      return 'offline'
    },

    // 等待高德地图加载
    waitForAMap() {
      let retryCount = 0
      const maxRetries = 50

      const checkAMap = () => {
        if (typeof AMap !== 'undefined' && typeof AMap.Map === 'function') {
          console.log('AMap loaded successfully')
          this.initMap()
          this.getVehicleList()
        } else if (retryCount < maxRetries) {
          retryCount++
          setTimeout(checkAMap, 500)
        } else {
          this.$message.error('地图加载失败，请检查网络连接后刷新页面重试')
          this.useMockData()
        }
      }

      checkAMap()
    },

    // 初始化地图
    initMap() {
      const AMapObj = window.AMap || AMap

      if (typeof AMapObj === 'undefined' || typeof AMapObj.Map !== 'function') {
        setTimeout(() => this.initMap(), 500)
        return
      }

      try {
        const container = document.getElementById('amapContainer')
        if (container) {
          container.style.width = '100%'
          container.style.height = '100%'
        }

        this.map = new AMapObj.Map('amapContainer', {
          zoom: 11,
          center: [116.397428, 39.90923],
          resizeEnable: true,
          viewMode: '2D'
        })

        AMapObj.plugin(['AMap.ToolBar', 'AMap.Geocoder'], () => {
          this.map.addControl(new AMapObj.ToolBar())
          this.geocoder = new AMapObj.Geocoder()
          this.mapReady = true
          console.log('Map plugins loaded')

          if (this.selectedVehicle) {
            this.initRoute()
          }
        })

        console.log('Map initialized successfully')
      } catch (e) {
        console.error('Failed to initialize map:', e)
        this.$message.error('地图初始化失败')
      }
    },

    // 获取车辆列表
    getVehicleList() {
      this.$http({
        url: 'yunshuxinxi/page',
        method: 'get',
        params: {
          page: 1,
          limit: 100,
          sort: 'id',
          order: 'desc'
        }
      }).then(({ data }) => {
        if (data && data.code === 0) {
          this.vehicleList = data.data.list || []
          this.vehicleList.forEach(v => {
            this.$set(this.vehicleWarnings, v.id, { speed: false, deviation: false })
          })
          if (this.vehicleList.length > 0) {
            this.selectVehicle(this.vehicleList[0])
          } else {
            this.useMockData()
          }
        } else {
          this.useMockData()
        }
      }).catch(() => {
        this.useMockData()
      })
    },

    // 模拟数据
    useMockData() {
      this.vehicleList = [
        {
          id: 1,
          chepaihao: '京A88888',
          cheliangpinpai: '东风重卡',
          weixianpinmingcheng: '液化石油气',
          xingming: '张伟',
          qidian: '北京市朝阳区',
          zhongdian: '北京市大兴区',
          zhuangtai: '运输中',
          sudu: '60'
        }
      ]
      this.vehicleList.forEach(v => {
        this.$set(this.vehicleWarnings, v.id, { speed: false, deviation: false })
      })
      if (this.vehicleList.length > 0) {
        this.selectVehicle(this.vehicleList[0])
      }
    },

    // 搜索车辆
    searchVehicle() {
      let params = {
        page: 1,
        limit: 100,
        sort: 'id',
        order: 'desc'
      }
      if (this.searchForm.chepaihao) {
        params.chepaihao = '%' + this.searchForm.chepaihao + '%'
      }
      this.$http({
        url: 'yunshuxinxi/page',
        method: 'get',
        params: params
      }).then(({ data }) => {
        if (data && data.code === 0) {
          this.vehicleList = data.data.list || []
          console.log('获取到车辆列表:', this.vehicleList.length, '辆')
          this.vehicleList.forEach((v, i) => {
            console.log(`车辆${i + 1}:`, v.chepaihao, '起点:', v.qidian, '终点:', v.zhongdian)
            if (!this.vehicleWarnings[v.id]) {
              this.$set(this.vehicleWarnings, v.id, { speed: false, deviation: false })
            }
          })
          if (this.vehicleList.length > 0) {
            this.selectVehicle(this.vehicleList[0])
          } else {
            this.$message.warning('未找到匹配的车辆')
          }
        }
      })
    },

    // 重置搜索
    resetSearch() {
      this.searchForm.chepaihao = ''
      this.getVehicleList()
    },

    // 选择车辆
    selectVehicle(vehicle) {
      console.log('selectVehicle 被调用，车辆:', vehicle.chepaihao, '起点:', vehicle.qidian, '终点:', vehicle.zhongdian)
      this.stopSimulation()
      this.selectedVehicle = vehicle
      this.warningList = []
      this.isArrived = vehicle.zhuangtai === '已完成'
      this.progressPercent = this.isArrived ? 100 : 0
      this.deviationDistance = 0
      this.speedWarning = false
      this.deviationWarning = false
      this.hasWarningTriggered = false
      this.currentSpeed = this.isArrived ? 0 : (parseInt(vehicle.sudu) || 60)
      this.currentAddress = ''

      // 初始化起点和终点坐标
      this.initRoute()
    },

    // 初始化路线（默认使用HTTP API）
    initRoute() {
      // 优先使用HTTP方式调用高德Web API
      this.initRouteHTTP()
    },

    // 构建完整地址
    buildFullAddress(address) {
      if (!address) return ''

      // 清理地址
      let cleanAddress = address.trim()

      // 如果地址已经包含省/市/区/县信息，说明是完整地址，直接使用
      if (cleanAddress.includes('省') || cleanAddress.includes('市') || cleanAddress.includes('区') || cleanAddress.includes('县')) {
        return cleanAddress
      }

      // 地址太短（可能是简称或门牌号），添加山西省让高德自动判断城市
      if (cleanAddress.length < 8) {
        return '山西省' + cleanAddress
      }

      // 其他不完整地址，添加山西省
      return '山西省' + cleanAddress
    },

    // 使用HTTP方式调用高德地理编码API
    geocodeAddressHTTP(address) {
      return new Promise((resolve, reject) => {
        const key = 'e2729ad6d357af19a6882fa4cf277470'
        const url = `https://restapi.amap.com/v3/geocode/geo?address=${encodeURIComponent(address)}&key=${key}`

        fetch(url)
          .then(response => response.json())
          .then(data => {
            console.log('HTTP地理编码结果:', data)
            if (data.status === '1' && data.geocodes && data.geocodes.length > 0) {
              const location = data.geocodes[0].location
              resolve({
                lng: parseFloat(location.split(',')[0]),
                lat: parseFloat(location.split(',')[1]),
                formattedAddress: data.geocodes[0].formatted_address
              })
            } else {
              reject(data.info || '地址解析失败')
            }
          })
          .catch(error => {
            console.error('HTTP请求失败:', error)
            reject(error)
          })
      })
    },

    // 初始化路线（使用HTTP API）
    initRouteHTTP() {
      if (!this.selectedVehicle) return

      const currentVehicleId = this.selectedVehicle.id

      this.clearMarkers()

      const startAddress = this.selectedVehicle.qidian || ''
      const endAddress = this.selectedVehicle.zhongdian || ''

      console.log('选择车辆:', this.selectedVehicle.chepaihao, 'ID:', currentVehicleId)
      console.log('起点:', startAddress, '终点:', endAddress)

      if (!startAddress || !endAddress) {
        this.$message.warning('请先设置货物的起点和终点信息')
        return
      }

      const fullStartAddress = this.buildFullAddress(startAddress)
      const fullEndAddress = this.buildFullAddress(endAddress)

      this.$message.info('正在解析地址坐标...')

      // 使用HTTP API获取起点坐标
      this.geocodeAddressHTTP(fullStartAddress)
        .then(startResult => {
          if (this.selectedVehicle.id !== currentVehicleId) return

          this.startLng = startResult.lng
          this.startLat = startResult.lat
          console.log('起点坐标成功:', this.startLng, this.startLat, startResult.formattedAddress)

          // 获取终点坐标
          return this.geocodeAddressHTTP(fullEndAddress)
        })
        .then(endResult => {
          if (this.selectedVehicle.id !== currentVehicleId) return

          this.endLng = endResult.lng
          this.endLat = endResult.lat
          console.log('终点坐标成功:', this.endLng, this.endLat, endResult.formattedAddress)

          this.currentLng = this.startLng
          this.currentLat = this.startLat

          if (this.isArrived) {
            this.currentLng = this.endLng
            this.currentLat = this.endLat
          }

          this.$message.success('地址解析成功，正在规划路线...')
          this.planRoute()
        })
        .catch(error => {
          console.error('地址解析失败:', error)
          this.$message.error('地址解析失败: ' + error)
        })
    },

    // 高德路径规划获取真实路线
    planRoute() {
      const AMapObj = window.AMap || AMap

      // 加载驾车路径规划插件
      AMapObj.plugin('AMap.Driving', () => {
        const driving = new AMapObj.Driving({
          map: this.map,
          panel: null,
          policy: AMapObj.DrivingPolicy.LEAST_TIME,
          showMarkers: false
        })

        driving.search(
          new AMapObj.LngLat(this.startLng, this.startLat),
          new AMapObj.LngLat(this.endLng, this.endLat),
          (status, result) => {
            if (status === 'complete' && result.routes && result.routes.length > 0) {
              console.log('路径规划成功，获取到', result.routes.length, '条路线')

              // 获取第一条路线
              const route = result.routes[0]
              this.routePoints = []

              // 从路径详情中提取所有路径点
              result.routes.forEach((r, index) => {
                console.log(`路线${index + 1}: 距离${(r.distance / 1000).toFixed(2)}km, 耗时${Math.round(r.time / 60)}分钟`)
              })

              // 使用第一条路线的点
              if (route.steps) {
                route.steps.forEach(step => {
                  if (step.path) {
                    step.path.forEach(p => {
                      this.routePoints.push(new AMapObj.LngLat(p.lng, p.lat))
                    })
                  }
                })
              }

              // 如果没有提取到点，生成直线点（备用）
              if (this.routePoints.length < 2) {
                this.generateLinearRoute()
              } else {
                this.totalPoints = this.routePoints.length - 1
                this.currentPointIndex = this.isArrived ? this.totalPoints : 0
                console.log('路线点数:', this.routePoints.length)
              }

              this.drawMap()
            } else {
              console.log('路径规划失败，使用线性路线:', status, result)
              // 路径规划失败时，使用线性路线
              this.generateLinearRoute()
              this.drawMap()
            }
          }
        )
      })
    },

    // 生成线性路线（备用方案）
    generateLinearRoute() {
      const AMapObj = window.AMap || AMap
      this.routePoints = []
      this.totalPoints = 100

      console.log('generateLinearRoute - 使用坐标:', {
        start: [this.startLng, this.startLat],
        end: [this.endLng, this.endLat]
      })

      for (let i = 0; i <= this.totalPoints; i++) {
        const ratio = i / this.totalPoints
        let lng = this.startLng + (this.endLng - this.startLng) * ratio
        let lat = this.startLat + (this.endLat - this.startLat) * ratio

        if (i > 0 && i < this.totalPoints) {
          lng += (Math.random() - 0.5) * 0.001
          lat += (Math.random() - 0.5) * 0.001
        }

        this.routePoints.push(new AMapObj.LngLat(lng, lat))
      }

      this.currentPointIndex = this.isArrived ? this.totalPoints : 0
    },

    // 清除标记
    clearMarkers() {
      if (this.marker) {
        this.map.remove(this.marker)
        this.marker = null
      }
      if (this.polyline) {
        this.map.remove(this.polyline)
        this.polyline = null
      }
      if (this.passedPolyline) {
        this.map.remove(this.passedPolyline)
        this.passedPolyline = null
      }
      if (this.startMarker) {
        this.map.remove(this.startMarker)
        this.startMarker = null
      }
      if (this.endMarker) {
        this.map.remove(this.endMarker)
        this.endMarker = null
      }
    },

    // 绘制地图
    drawMap() {
      const AMapObj = window.AMap || AMap

      this.clearMarkers()

      // 绘制完整路线（浅蓝色实线，更简洁）
      this.polyline = new AMapObj.Polyline({
        map: this.map,
        path: this.routePoints,
        strokeColor: '#8EBBD6',
        strokeOpacity: 0.8,
        strokeWeight: 4,
        strokeStyle: 'solid'
      })

      // 绘制已行驶路线（深蓝色实线）
      const passedPath = this.routePoints.slice(0, this.currentPointIndex + 1)
      this.passedPolyline = new AMapObj.Polyline({
        map: this.map,
        path: passedPath,
        strokeColor: '#409EFF',
        strokeOpacity: 1,
        strokeWeight: 5,
        strokeStyle: 'solid'
      })

      // 起点标记
      this.startMarker = new AMapObj.Marker({
        map: this.map,
        position: this.routePoints[0],
        icon: new AMapObj.Icon({
          size: new AMapObj.Size(32, 44),
          image: 'https://webapi.amap.com/theme/v1.3/markers/n/start.png',
          imageSize: new AMapObj.Size(32, 44)
        }),
        offset: new AMapObj.Pixel(-16, -22)
      })

      // 终点标记
      this.endMarker = new AMapObj.Marker({
        map: this.map,
        position: this.routePoints[this.totalPoints],
        icon: new AMapObj.Icon({
          size: new AMapObj.Size(32, 44),
          image: 'https://webapi.amap.com/theme/v1.3/markers/n/end.png',
          imageSize: new AMapObj.Size(32, 44)
        }),
        offset: new AMapObj.Pixel(-16, -22)
      })

      // 添加车辆标记
      this.addVehicleMarker()

      this.map.setFitView()
    },

    // 添加车辆标记
    addVehicleMarker() {
      const AMapObj = window.AMap || AMap

      if (this.marker) {
        this.map.remove(this.marker)
      }

      const truckContent = document.createElement('div')
      truckContent.className = 'custom-truck-marker'
      truckContent.innerHTML = `
        <div class="truck-marker-container">
          <div class="truck-icon">
            <svg width="40" height="40" viewBox="0 0 24 24" fill="#fff">
              <path d="M18.92 6.01C18.72 5.42 18.16 5 17.5 5h-11c-.66 0-1.21.42-1.42 1.01L3 12v8c0 .55.45 1 1 1h1c.55 0 1-.45 1-1v-1h12v1c0 .55.45 1 1 1h1c.55 0 1-.45 1-1v-8l-2.08-5.99zM6.5 16c-.83 0-1.5-.67-1.5-1.5S5.67 13 6.5 13s1.5.67 1.5 1.5S7.33 16 6.5 16zm11 0c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5zM5 11l1.5-4.5h11L19 11H5z"/>
            </svg>
          </div>
          <div class="truck-label">${this.selectedVehicle ? this.selectedVehicle.chepaihao : ''}</div>
        </div>
      `

      this.injectMarkerStyles()

      this.marker = new AMapObj.Marker({
        position: this.routePoints[this.currentPointIndex],
        content: truckContent,
        autoRotation: true,
        angle: 0,
        zIndex: 100
      })

      this.map.add(this.marker)
    },

    // 注入标记样式
    injectMarkerStyles() {
      let style = document.getElementById('truck-marker-styles')
      if (!style) {
        style = document.createElement('style')
        style.id = 'truck-marker-styles'
        document.head.appendChild(style)
      }
      if (style.textContent.indexOf('custom-truck-marker') === -1) {
        style.textContent += `
          .custom-truck-marker { cursor: pointer; }
          .truck-marker-container {
            display: flex;
            flex-direction: column;
            align-items: center;
          }
          .truck-icon {
            width: 44px;
            height: 44px;
            background: linear-gradient(135deg, #409EFF, #66b1ff);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 12px rgba(64, 158, 255, 0.5);
            border: 3px solid #fff;
          }
          .truck-icon svg { width: 28px; height: 28px; }
          .truck-label {
            background: rgba(64, 158, 255, 0.9);
            color: #fff;
            padding: 2px 8px;
            border-radius: 4px;
            font-size: 11px;
            font-weight: bold;
            margin-top: 4px;
            white-space: nowrap;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
          }
        `
      }
    },

    // 开始模拟
    startSimulation() {
      if (!this.selectedVehicle) {
        this.$message.warning('请先选择一辆车')
        return
      }

      if (!this.mapReady) {
        this.$message.warning('地图正在加载中，请稍后...')
        return
      }

      if (this.isSimulating) {
        return
      }

      if (this.isArrived) {
        this.$message.warning('已到达终点，请重新选择车辆')
        return
      }

      if (this.routePoints.length < 2) {
        this.$message.info('正在初始化路线...')
        this.initRoute()
        setTimeout(() => {
          if (this.routePoints.length >= 2) {
            this.doStartSimulation()
          }
        }, 2000)
        return
      }

      this.doStartSimulation()
    },

    // 开始模拟
    doStartSimulation() {
      this.isSimulating = true
      this.currentPointIndex = 0
      this.currentSpeed = parseInt(this.selectedVehicle.sudu) || 60
      this.hasWarningTriggered = false // 重置预警标记

      // 重置已行驶路径
      if (this.passedPolyline) {
        this.passedPolyline.setPath([this.routePoints[0]])
      }

      // 更新状态为进行中
      this.$http({
        url: 'yunshuxinxi/update',
        method: 'post',
        data: {
          id: this.selectedVehicle.id,
          zhuangtai: '进行中'
        }
      }).catch(() => {})

      if (this.selectedVehicle.yunshucheciid) {
        this.$http({
          url: 'yunshucheci/update',
          method: 'post',
          data: {
            id: this.selectedVehicle.yunshucheciid,
            yunshuzhuangtai: '进行中'
          }
        }).catch(() => {})
      }

      // 更新本地状态
      this.selectedVehicle.zhuangtai = '进行中'
      const index = this.vehicleList.findIndex(v => v.id === this.selectedVehicle.id)
      if (index !== -1) {
        this.vehicleList[index].zhuangtai = '进行中'
      }

      this.$message.success('开始模拟车辆运行')

      this.moveVehicle()
    },

    // 移动车辆
    moveVehicle() {
      if (!this.isSimulating) return

      // 检查是否到达终点
      if (this.currentPointIndex >= this.totalPoints) {
        this.isArrived = true
        this.isSimulating = false
        this.progressPercent = 100
        this.currentSpeed = 0
        this.$message.success('车辆已到达终点！运输完成！')
        this.finishTransport()
        return
      }

      // 每步移动2个点，约50秒走完全程（更慢）
      this.currentPointIndex += 2
      if (this.currentPointIndex > this.totalPoints) {
        this.currentPointIndex = this.totalPoints
      }

      // 更新当前位置
      const currentPos = this.routePoints[this.currentPointIndex]
      this.currentLng = currentPos.lng
      this.currentLat = currentPos.lat

      // 更新进度
      this.progressPercent = Math.floor((this.currentPointIndex / this.totalPoints) * 100)

      // 更新已行驶路径
      const passedPath = this.routePoints.slice(0, this.currentPointIndex + 1)
      if (this.passedPolyline) {
        this.passedPolyline.setPath(passedPath)
      }

      // 更新车辆位置
      if (this.marker) {
        this.marker.setPosition(currentPos)

        if (this.currentPointIndex > 0) {
          const prevPoint = this.routePoints[this.currentPointIndex - 1]
          const angle = this.calculateAngle(prevPoint, currentPos)
          this.marker.setAngle(angle)
        }
      }

      // 模拟速度变化（正常速度，不超速）
      this.simulateSpeed()

      // 检测预警（一次模拟最多一条）
      this.checkWarnings()

      // 自动跟随
      if (this.currentPointIndex % 20 === 0) {
        this.map.setCenter(currentPos)
      }

      // 更新地址
      if (this.currentPointIndex % 40 === 0) {
        this.updateAddress()
      }

      // 保存位置
      this.saveCurrentPosition()

      // 继续移动（每800ms移动2个点，约50秒走完全程）
      this.simulationTimer = setTimeout(() => this.moveVehicle(), 800)
    },

    // 模拟速度（正常行驶，不超速）
    simulateSpeed() {
      // 基础速度稳定在50-65之间
      const baseSpeed = 50 + Math.floor(Math.random() * 15)
      this.currentSpeed = baseSpeed
    },

    // 检测预警（一次模拟最多一条）
    checkWarnings() {
      // 整个模拟过程只有一次预警机会
      if (this.hasWarningTriggered) {
        this.deviationDistance = Math.max(0, this.deviationDistance - 0.02)
        if (this.deviationDistance < 0.3) {
          this.deviationWarning = false
          if (this.vehicleWarnings[this.selectedVehicle.id]) {
            this.vehicleWarnings[this.selectedVehicle.id].deviation = false
          }
        }
        return
      }

      // 模拟过程中只有1%概率产生一条预警
      if (Math.random() > 0.99) {
        this.hasWarningTriggered = true

        // 随机选择超速或偏离
        if (Math.random() > 0.5) {
          // 超速预警
          this.currentSpeed = 85 + Math.floor(Math.random() * 10)
          this.speedWarning = true
          this.vehicleWarnings[this.selectedVehicle.id] = {
            ...this.vehicleWarnings[this.selectedVehicle.id],
            speed: true
          }

          const warning = {
            type: 'danger',
            time: new Date().toLocaleTimeString(),
            message: `[超速] ${this.selectedVehicle.chepaihao} 速度${this.currentSpeed}km/h超过限速${this.speedLimit}km/h`
          }
          this.warningList.unshift(warning)
          this.saveWarningToDb(warning)

        } else {
          // 偏离预警
          this.deviationDistance = 0.5 + Math.random() * 0.3
          this.deviationWarning = true
          this.vehicleWarnings[this.selectedVehicle.id] = {
            ...this.vehicleWarnings[this.selectedVehicle.id],
            deviation: true
          }

          const warning = {
            type: 'warning',
            time: new Date().toLocaleTimeString(),
            message: `[偏离] ${this.selectedVehicle.chepaihao} 偏离路线${this.deviationDistance.toFixed(2)}km`
          }
          this.warningList.unshift(warning)
          this.saveWarningToDb(warning)
        }
      }
    },

    // 保存预警到数据库（保存到警报界面管理 jingbaojiemian）
    saveWarningToDb(warning) {
      if (!this.selectedVehicle) return

      // 构建警报标题（包含类型和车牌号）
      const warningTitle = warning.type === 'danger' ? '超速警报' : '偏离警报'

      const warningData = {
        biaoti: `[${warningTitle}] ${this.selectedVehicle.chepaihao}`,
        jingleixing: warningTitle,
        chepaihao: this.selectedVehicle.chepaihao,
        jingbaoyuanyin: warning.message,
        jingbaoshijian: new Date().getTime(), // 使用时间戳
        xingming: this.selectedVehicle.xingming || '未知',
        dianhua: this.selectedVehicle.jiashiyuandianhua || '',
        weizhi: `经度:${this.currentLng.toFixed(6)},纬度:${this.currentLat.toFixed(6)}`,
        sudu: this.currentSpeed + ' km/h',
        sfsh: '待审核'
      }

      console.log('保存警报数据:', warningData)

      this.$http({
        url: 'jingbaojiemian/save',
        method: 'post',
        data: warningData
      }).then(({ data }) => {
        console.log('警报保存响应:', data)
        if (data && data.code === 0) {
          this.$message.success(`警报已触发：${warningTitle}`)
        } else {
          this.$message.error('警报保存失败: ' + (data ? data.msg : '未知错误'))
        }
      }).catch((err) => {
        console.error('警报保存失败', err)
        this.$message.error('警报保存失败: ' + err.message)
      })
    },

    // 更新地址
    updateAddress() {
      if (this.geocoder) {
        this.geocoder.getAddress([this.currentLng, this.currentLat], (status, result) => {
          if (status === 'complete' && result.regeocode) {
            this.currentAddress = result.regeocode.formattedAddress
          }
        })
      }
    },

    // 计算角度
    calculateAngle(from, to) {
      const dx = to.lng - from.lng
      const dy = to.lat - from.lat
      let angle = Math.atan2(dy, dx) * 180 / Math.PI
      return 90 - angle
    },

    // 停止模拟
    stopSimulation() {
      this.isSimulating = false
      if (this.simulationTimer) {
        clearTimeout(this.simulationTimer)
        this.simulationTimer = null
      }
    },

    // 定位车辆
    locateVehicle() {
      if (!this.selectedVehicle) {
        this.$message.warning('请先选择一辆车')
        return
      }

      if (!this.map) {
        this.$message.warning('地图正在加载中')
        return
      }

      const targetLng = this.isArrived ? this.endLng : this.currentLng
      const targetLat = this.isArrived ? this.endLat : this.currentLat

      this.map.setCenter([targetLng, targetLat])
      this.map.setZoom(15)

      const msg = this.isArrived ? '已到达终点' : `当前位置: ${this.progressPercent}%`
      this.$message({
        message: `${this.selectedVehicle.chepaihao} - ${msg}`,
        type: 'success',
        duration: 1500
      })
    },

    // 保存当前位置
    saveCurrentPosition() {
      if (!this.selectedVehicle) return

      this.$http({
        url: 'yunshuxinxi/update',
        method: 'post',
        data: {
          id: this.selectedVehicle.id,
          longitude: this.currentLng,
          latitude: this.currentLat,
          sudu: this.currentSpeed.toString(),
          zhuangtai: '运输中'
        }
      }).catch(() => {})
    },

    // 运输完成，更新运输信息
    finishTransport() {
      if (!this.selectedVehicle) return

      console.log('开始更新运输信息...')

      // 同时更新yunshuxinxi和yunshucheci
      const updatePromises = []

      // 格式化日期为 yyyy-MM-dd HH:mm:ss
      const formatDate = (date) => {
        const d = new Date(date)
        const pad = n => n < 10 ? '0' + n : n
        return `${d.getFullYear()}-${pad(d.getMonth()+1)}-${pad(d.getDate())} ${pad(d.getHours())}:${pad(d.getMinutes())}:${pad(d.getSeconds())}`
      }

      // 1. 更新yunshuxinxi表
      updatePromises.push(
        this.$http({
          url: 'yunshuxinxi/update',
          method: 'post',
          data: {
            id: this.selectedVehicle.id,
            zhuangtai: '已完成',
            jieshushijian: formatDate(new Date()),
            sudu: '0',
            longitude: this.endLng,
            latitude: this.endLat
          }
        })
      )

      // 2. 如果有yunshucheciid，更新yunshucheci表的状态
      if (this.selectedVehicle.yunshucheciid) {
        updatePromises.push(
          this.$http({
            url: 'yunshucheci/update',
            method: 'post',
            data: {
              id: this.selectedVehicle.yunshucheciid,
              yunshuzhuangtai: '已完成'
            }
          })
        )
      }

      Promise.all(updatePromises).then((results) => {
        const allSuccess = results.every(res => res.data && res.data.code === 0)
        if (allSuccess || results[0].data.code === 0) {
          // 更新本地数据
          this.selectedVehicle.zhuangtai = '已完成'
          this.selectedVehicle.jieshushijian = new Date()

          // 更新列表中的数据
          const index = this.vehicleList.findIndex(v => v.id === this.selectedVehicle.id)
          if (index !== -1) {
            this.vehicleList[index].zhuangtai = '已完成'
            this.vehicleList[index].jieshushijian = new Date()
          }

          this.$message.success('运输完成！运输信息已更新为已完成状态')
        } else {
          console.error('更新失败:', results)
        }
      }).catch((err) => {
        console.error('更新运输信息失败', err)
        // 即使车次更新失败，也要更新运输信息
        this.$message.warning('运输完成，但车次状态更新可能失败')
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.monitor-container {
  height: calc(100vh - 140px);
  display: flex;
  flex-direction: column;
  background: #f5f7fa;
}

.search-bar {
  background: #fff;
  padding: 20px;
  border-radius: 8px;
  margin-bottom: 15px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);

  ::v-deep .el-input {
    width: 200px;
  }
}

.monitor-content {
  flex: 1;
  display: flex;
  gap: 15px;
  min-height: 0;
}

.vehicle-list {
  width: 300px;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  display: flex;
  flex-direction: column;
  overflow: hidden;

  .list-header {
    padding: 15px;
    border-bottom: 1px solid #eee;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-weight: 600;
    color: #333;

    .count {
      font-size: 12px;
      color: #999;
      font-weight: normal;
    }
  }

  .vehicle-scrollbar {
    flex: 1;
    padding: 10px;
  }

  .vehicle-item {
    padding: 12px;
    border-radius: 8px;
    margin-bottom: 8px;
    cursor: pointer;
    display: flex;
    align-items: center;
    background: #f8f9fa;
    transition: all 0.3s;
    border: 2px solid transparent;

    &:hover {
      background: #ecf5ff;
    }

    &.selected {
      background: #ecf5ff;
      border-color: #409EFF;
    }

    &.warning {
      background: #fff4f0;
      border-color: #f56c6c;
    }

    &.arrived {
      background: #f0f9f0;
      border-color: #67C23A;
    }

    .vehicle-icon {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background: linear-gradient(135deg, #409EFF, #66b1ff);
      display: flex;
      align-items: center;
      justify-content: center;
      margin-right: 12px;
      position: relative;

      i {
        font-size: 20px;
        color: #fff;
      }

      .warning-badge {
        position: absolute;
        top: -4px;
        right: -4px;
        width: 18px;
        height: 18px;
        background: #f56c6c;
        color: #fff;
        border-radius: 50%;
        font-size: 12px;
        font-weight: bold;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 2px solid #fff;
      }

      .finish-badge {
        position: absolute;
        top: -4px;
        right: -4px;
        width: 18px;
        height: 18px;
        background: #67C23A;
        color: #fff;
        border-radius: 50%;
        font-size: 12px;
        font-weight: bold;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 2px solid #fff;
      }
    }

    .vehicle-info {
      flex: 1;
      overflow: hidden;

      .vehicle-plate {
        font-weight: 600;
        color: #333;
        margin-bottom: 4px;
      }

      .vehicle-status {
        font-size: 12px;
        color: #666;
        display: flex;
        align-items: center;

        .status-dot {
          width: 8px;
          height: 8px;
          border-radius: 50%;
          margin-right: 6px;

          &.online { background: #67C23A; }
          &.offline { background: #909399; }
          &.finish { background: #409EFF; }
        }
      }

      .vehicle-route {
        margin-top: 4px;

        .route-text {
          font-size: 11px;
          color: #999;
          display: inline-block;
          max-width: 180px;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
        }
      }
    }
  }

  .empty-list {
    text-align: center;
    padding: 40px 0;
    color: #999;

    i { font-size: 48px; margin-bottom: 10px; }
    p { margin: 0; }
    .tip { font-size: 12px; margin-top: 8px; color: #c0c4cc; }
  }
}

.map-container {
  flex: 1;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  display: flex;
  flex-direction: column;
  overflow: hidden;
  position: relative;

  .map-header {
    padding: 12px 15px;
    border-bottom: 1px solid #eee;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-weight: 600;
    color: #333;

    .header-right {
      display: flex;
      align-items: center;
      gap: 10px;

      .sim-status {
        color: #67C23A;
        font-size: 13px;

        i { margin-right: 4px; }

        &.arrive {
          color: #409EFF;
        }
      }
    }
  }

  .map-wrapper {
    flex: 1;
    min-height: 400px;
    width: 100%;
    height: calc(100% - 50px);
  }

  .simulation-indicator {
    position: absolute;
    bottom: 15px;
    left: 50%;
    transform: translateX(-50%);
    background: rgba(103, 194, 58, 0.95);
    padding: 8px 20px;
    border-radius: 20px;
    z-index: 99;
    color: #fff;

    .sim-info {
      display: flex;
      align-items: center;
      gap: 10px;
      font-size: 14px;

      i { font-size: 18px; }

      .sim-speed {
        background: rgba(255,255,255,0.3);
        padding: 2px 10px;
        border-radius: 10px;
        font-weight: bold;

        &.speed-high {
          background: #f56c6c;
        }
      }
    }
  }

  .map-overlay {
    position: absolute;
    top: 60px;
    left: 10px;
    background: rgba(255, 255, 255, 0.98);
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.15);
    z-index: 100;
    min-width: 300px;
    max-width: 340px;

    .overlay-title {
      font-size: 16px;
      font-weight: 600;
      color: #333;
      margin-bottom: 10px;
      padding-bottom: 8px;
      border-bottom: 1px solid #eee;
      display: flex;
      align-items: center;
      gap: 8px;

      .arrive-tag {
        background: #67C23A;
        color: #fff;
        padding: 2px 8px;
        border-radius: 4px;
        font-size: 12px;
      }

      .speed-warning-tag {
        background: #f56c6c;
        color: #fff;
        padding: 2px 8px;
        border-radius: 4px;
        font-size: 12px;
      }

      .deviation-warning-tag {
        background: #e6a23c;
        color: #fff;
        padding: 2px 8px;
        border-radius: 4px;
        font-size: 12px;
      }
    }

    .overlay-info {
      .info-row {
        display: flex;
        margin-bottom: 6px;
        font-size: 13px;

        &:last-child { margin-bottom: 0; }

        .label {
          color: #666;
          min-width: 85px;
        }

        .value {
          color: #333;
          font-weight: 500;
          flex: 1;
          word-break: break-all;

          &.speed-red {
            color: #f56c6c;
            font-weight: bold;
          }
        }
      }

      .progress-bar {
        margin-top: 12px;
        padding-top: 10px;
        border-top: 1px solid #eee;

        .progress-label {
          display: block;
          font-size: 12px;
          color: #666;
          margin-bottom: 6px;
        }
      }
    }
  }

  .warning-panel {
    position: absolute;
    bottom: 10px;
    right: 10px;
    background: rgba(255, 255, 255, 0.98);
    border-radius: 8px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.2);
    width: 340px;
    max-height: 180px;
    overflow: hidden;
    z-index: 100;

    .warning-header {
      padding: 10px 15px;
      background: #f56c6c;
      color: #fff;
      font-weight: 600;
      display: flex;
      align-items: center;
      gap: 8px;

      .warning-count {
        background: rgba(255, 255, 255, 0.3);
        padding: 0 8px;
        border-radius: 10px;
        font-size: 12px;
      }
    }

    .warning-list {
      max-height: 130px;
      overflow-y: auto;
      padding: 8px;

      .warning-item {
        padding: 8px;
        margin-bottom: 6px;
        border-radius: 4px;
        font-size: 12px;
        border-left: 3px solid;

        &.danger {
          background: #fef0f0;
          border-color: #f56c6c;
        }

        &.warning {
          background: #fdf6ec;
          border-color: #e6a23c;
        }

        .warning-time {
          color: #909399;
          margin-right: 8px;
        }
      }
    }
  }
}
</style>
