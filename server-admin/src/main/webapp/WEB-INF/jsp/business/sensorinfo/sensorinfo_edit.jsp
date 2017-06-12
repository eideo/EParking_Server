<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="sensorinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SENSORINFO_ID" id="SENSORINFO_ID" value="${pd.SENSORINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注1:</td>
								<td><input type="number" name="ID" id="ID" value="${pd.ID}" maxlength="32" placeholder="这里输入备注1" title="备注1" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注2:</td>
								<td><input type="text" name="CODE" id="CODE" value="${pd.CODE}" maxlength="20" placeholder="这里输入备注2" title="备注2" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注3:</td>
								<td><input type="number" name="TYPE" id="TYPE" value="${pd.TYPE}" maxlength="32" placeholder="这里输入备注3" title="备注3" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注4:</td>
								<td><input type="number" name="STATE" id="STATE" value="${pd.STATE}" maxlength="32" placeholder="这里输入备注4" title="备注4" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注5:</td>
								<td><input type="number" name="SENSORID" id="SENSORID" value="${pd.SENSORID}" maxlength="32" placeholder="这里输入备注5" title="备注5" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注6:</td>
								<td><input type="text" name="BATTERY" id="BATTERY" value="${pd.BATTERY}" maxlength="12" placeholder="这里输入备注6" title="备注6" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注7:</td>
								<td><input type="number" name="X0" id="X0" value="${pd.X0}" maxlength="32" placeholder="这里输入备注7" title="备注7" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注8:</td>
								<td><input type="number" name="Y0" id="Y0" value="${pd.Y0}" maxlength="32" placeholder="这里输入备注8" title="备注8" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注9:</td>
								<td><input type="number" name="Z0" id="Z0" value="${pd.Z0}" maxlength="32" placeholder="这里输入备注9" title="备注9" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注10:</td>
								<td><input type="number" name="X1" id="X1" value="${pd.X1}" maxlength="32" placeholder="这里输入备注10" title="备注10" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注11:</td>
								<td><input type="number" name="Y1" id="Y1" value="${pd.Y1}" maxlength="32" placeholder="这里输入备注11" title="备注11" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注12:</td>
								<td><input type="number" name="Z1" id="Z1" value="${pd.Z1}" maxlength="32" placeholder="这里输入备注12" title="备注12" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注13:</td>
								<td><input type="text" name="MAGNETISM" id="MAGNETISM" value="${pd.MAGNETISM}" maxlength="12" placeholder="这里输入备注13" title="备注13" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注14:</td>
								<td><input type="number" name="DISTANCE" id="DISTANCE" value="${pd.DISTANCE}" maxlength="32" placeholder="这里输入备注14" title="备注14" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注15:</td>
								<td><input type="number" name="ERROR" id="ERROR" value="${pd.ERROR}" maxlength="32" placeholder="这里输入备注15" title="备注15" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#ID").val()==""){
				$("#ID").tips({
					side:3,
		            msg:'请输入备注1',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ID").focus();
			return false;
			}
			if($("#CODE").val()==""){
				$("#CODE").tips({
					side:3,
		            msg:'请输入备注2',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CODE").focus();
			return false;
			}
			if($("#TYPE").val()==""){
				$("#TYPE").tips({
					side:3,
		            msg:'请输入备注3',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TYPE").focus();
			return false;
			}
			if($("#STATE").val()==""){
				$("#STATE").tips({
					side:3,
		            msg:'请输入备注4',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STATE").focus();
			return false;
			}
			if($("#SENSORID").val()==""){
				$("#SENSORID").tips({
					side:3,
		            msg:'请输入备注5',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SENSORID").focus();
			return false;
			}
			if($("#BATTERY").val()==""){
				$("#BATTERY").tips({
					side:3,
		            msg:'请输入备注6',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BATTERY").focus();
			return false;
			}
			if($("#X0").val()==""){
				$("#X0").tips({
					side:3,
		            msg:'请输入备注7',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#X0").focus();
			return false;
			}
			if($("#Y0").val()==""){
				$("#Y0").tips({
					side:3,
		            msg:'请输入备注8',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#Y0").focus();
			return false;
			}
			if($("#Z0").val()==""){
				$("#Z0").tips({
					side:3,
		            msg:'请输入备注9',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#Z0").focus();
			return false;
			}
			if($("#X1").val()==""){
				$("#X1").tips({
					side:3,
		            msg:'请输入备注10',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#X1").focus();
			return false;
			}
			if($("#Y1").val()==""){
				$("#Y1").tips({
					side:3,
		            msg:'请输入备注11',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#Y1").focus();
			return false;
			}
			if($("#Z1").val()==""){
				$("#Z1").tips({
					side:3,
		            msg:'请输入备注12',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#Z1").focus();
			return false;
			}
			if($("#MAGNETISM").val()==""){
				$("#MAGNETISM").tips({
					side:3,
		            msg:'请输入备注13',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MAGNETISM").focus();
			return false;
			}
			if($("#DISTANCE").val()==""){
				$("#DISTANCE").tips({
					side:3,
		            msg:'请输入备注14',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DISTANCE").focus();
			return false;
			}
			if($("#ERROR").val()==""){
				$("#ERROR").tips({
					side:3,
		            msg:'请输入备注15',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ERROR").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>