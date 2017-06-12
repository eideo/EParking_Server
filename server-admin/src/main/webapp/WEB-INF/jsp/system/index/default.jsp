<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 百度echarts -->
<script src="plugins/echarts/echarts.min.js"></script>
<script type="text/javascript">

setTimeout("top.hangge()",500);
</script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=40GWXiduhOft266lK4N1dopL"></script>

</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="row">
						<div class="col-xs-12">

							<div class="alert alert-block alert-success">
								<button type="button" class="close" data-dismiss="alert">
									<i class="ace-icon fa fa-times"></i>
								</button>
								<i class="ace-icon fa fa-check green"></i>
								欢迎使用共享停车系统

							</div>
							
							
							<div id="main" style="width: 1600px;height:650px;"></div>

							
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->


		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->
	<script type="text/javascript">
		// 百度地图API功能
		var map = new BMap.Map("main");
		map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
		map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用

		var point = new BMap.Point(${pd.longitude},${pd.latitude});
		map.centerAndZoom(point,13);
        var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
        var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
//        var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
        map.addControl(top_left_control);
        map.addControl(top_left_navigation);
//        map.addEventListener("click",function(e){
//            alert(e.point.lng + "," + e.point.lat);
//        });
        var opts = {
            width : 250,     // 信息窗口宽度
            height: 80,     // 信息窗口高度
            title : "停车场信息" , // 信息窗口标题
            enableMessage:true//设置允许信息窗发送短息
        };
//        map.addControl(top_right_navigation);
        <%--alert('电池：'+${pd.batterys});--%>
        <c:forEach items="${parkerList}" var="var" varStatus="vs">
        var pt = new BMap.Point(${var.LONGITUDE},${var.LATITUDE});
//        alert('电池：'+pt);
        var myIcon = new BMap.Icon("/static/images/local_parking_32px.png", new BMap.Size(32,32));
//        var mk2 =
//        map.addOverlay(mk2);              // 将标注添加到地图中
//        var marker = new BMap.Marker(pt);
        var marker = new BMap.Marker(pt,{icon:myIcon});  // 创建标注
        map.addOverlay(marker);


        var content = "型号"+ ${var.NAME};
        addClickHandler(content,marker);
		</c:forEach>

        function addClickHandler(content,marker){
            marker.addEventListener("click",function(e){
                openInfo(content,e)}
            );
        }
        function openInfo(content,e){
            var p = e.target;
            var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
            var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象
            map.openInfoWindow(infoWindow,point); //开启信息窗口
        }
		var geolocation = new BMap.Geolocation();
		geolocation.getCurrentPosition(function(r){
			if(this.getStatus() == BMAP_STATUS_SUCCESS){

//                var mk = new BMap.Marker(r.point);
//
//                map.addOverlay(mk);
				map.panTo(r.point);
			//	mk.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画


			//	alert('您的位置：'+r.point.lng+','+r.point.lat);
			}
			else {
			//	alert('failed'+this.getStatus());
			}
		},{enableHighAccuracy: true})
		//关于状态码
		//BMAP_STATUS_SUCCESS	检索成功。对应数值“0”。
		//BMAP_STATUS_CITY_LIST	城市列表。对应数值“1”。
		//BMAP_STATUS_UNKNOWN_LOCATION	位置结果未知。对应数值“2”。
		//BMAP_STATUS_UNKNOWN_ROUTE	导航结果未知。对应数值“3”。
		//BMAP_STATUS_INVALID_KEY	非法密钥。对应数值“4”。
		//BMAP_STATUS_INVALID_REQUEST	非法请求。对应数值“5”。
		//BMAP_STATUS_PERMISSION_DENIED	没有权限。对应数值“6”。(自 1.1 新增)
		//BMAP_STATUS_SERVICE_UNAVAILABLE	服务不可用。对应数值“7”。(自 1.1 新增)
		//BMAP_STATUS_TIMEOUT	超时。对应数值“8”。(自 1.1 新增)
	</script>

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());
	</script>
<script type="text/javascript" src="static/ace/js/jquery.js"></script>
</body>
</html>