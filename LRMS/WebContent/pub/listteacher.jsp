<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	int i=0;
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>教师管理</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome/css/font-awesome.css">

    <script src="${pageContext.request.contextPath}/lib/jquery-1.8.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/javascripts/layer/layer.js" type="text/javascript"></script>
    <!-- Demo page code -->
    
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>
	<script type="text/javascript">
		window.id=0;
		function addTeacher(){
			window.location.href='${pageContext.request.contextPath}/admin/addteacher.jsp';
		}
		function confirm(id){
			window.id=id;
		}
		function deleteTc()
		{
			$.post("teacherservice!delete.action",{'id':window.id},function(result){
				if(result.message=="删除成功！"){
					layer.msg('删除成功！', {icon: 4});
					window.location.href='scanteacher';
				}else{
					layer.msg('删除失败：'+result.message, {icon: 2});
				}
			},"json");
		}
	</script>
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-57-precomposed.png">
  </head>

  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7"> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8"> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9"> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
  <body> 
  <!--<![endif]-->
<!-- 头部 -->
	<jsp:include page="../page/header.jsp"></jsp:include> 


    <div class="container-fluid">
        
        <div class="row-fluid">
            <div class="span3">
                <div class="sidebar-nav">
                  <div class="nav-header" data-toggle="collapse" data-target="#dashboard-menu"><i class="icon-dashboard"></i>预约管理</div>
                    <ul id="dashboard-menu" class="nav nav-list collapse in">
                        <s:if test="#session.user.type==3">
                        	<li><a href="scancourse?type=2">未审核预约</a></li>
                        	<li><a href="scancourse?type=0">预约记录</a></li>
                        </s:if>
                        <s:if test="#session.user.type==1">
                        	<li><a href="courseservice!book.action">预约</a></li>
                        	<li><a href="scancourse?type=0">预约记录</a></li>
                        </s:if>
                        <s:if test="#session.user.type==2">
                     		<li><a href="courseservice!book.action">预约</a></li>
                        	<li><a href="scancourse?type=0">预约记录</a></li>
                        </s:if>
                    </ul>
                <div class="nav-header" data-toggle="collapse" data-target="#accounts-menu"><i class="icon-briefcase"></i>查看课表</div>
                <ul id="accounts-menu" class="nav nav-list collapse in">
                  <li ><a href="scancourse?type=1">查看课表</a></li>
                </ul>
                <s:if test="#session.user.type!=1">
				<div class="nav-header" data-toggle="collapse" data-target="#account-menu"><i class="icon-briefcase"></i>人员管理</div>
                <ul id="account-menu" class="nav nav-list collapse in">
                  <s:if test="#session.user.type==3">
                  	<li ><a href="${pageContext.request.contextPath}/admin/addadmin.jsp">增加管理员</a></li>
                  	<li ><a href="scanadmin">管理员管理</a></li>
                  	<li ><a href="${pageContext.request.contextPath}/admin/addteacher.jsp">增加教师</a></li>
                  	<li ><a href="scanteacher">教师管理</a></li>
                  </s:if>
                  <s:if test="#session.user.type==2">
                  	<li ><a href="studentservice!edit.action">设置课代表</a></li>
                  </s:if>
                  <li ><a href="scanstudent">查看课代表</a></li>
                </ul>
                </s:if>
                 <s:if test="#session.user.type==3">
                <div class="nav-header" data-toggle="collapse" data-target="#settings-menu"><i class="icon-exclamation-sign"></i>实验室管理</div>
                <ul id="settings-menu" class="nav nav-list collapse in">
                  <li ><a href="scanroom">实验室管理</a></li>
	              <li ><a href="${pageContext.request.contextPath}/admin/addroom.jsp">添加实验室</a></li>
                </ul>
                </s:if>
            </div>
            
        </div>
        <div class="span9">
            <h1 class="page-title">教师管理</h1>
<div class="btn-toolbar">
    <s:if test="#session.user.type==3">
    <button class="btn btn-primary" onclick="addTeacher();"><i class="icon-plus"></i> 增加教师</button>
  	</s:if>
  <div class="btn-group">
  </div>
</div>
<div class="well">
    <table class="table">
      <thead>
        <tr>
          <th>#</th>
          <th>教工号</th>
          <th>教工姓名</th>
          <th>指导课程</th>
          <th style="width: 26px;"></th>
        </tr>
      </thead>
      <tbody>
      	<s:iterator value="#session.teachers" id="infos">
      		<tr>
	      		<td><%=++i%></td>
	      		<td><a href="teacherservice!edit.action?id=<s:property value="#infos.id" />"><s:property value="#infos.no" /></a></td>
				<td><s:property value="#infos.name" /></td>
	          	<td><s:property value="#infos.courseName" /></td>
	          	<s:if test="#session.user.type==3">
	          	<td>
		            <a href="teacherservice!edit.action?id=<s:property value="#infos.id" />"><i class="icon-pencil"></i></a>
		            <a href="#myModal" role="button" data-toggle="modal" onclick="confirm(<s:property value="#infos.id" />)"><i class="icon-remove"></i></a>
		        </td>
		        </s:if>
			</tr>
		</s:iterator>
      </tbody>
    </table>
</div>
<div class="pagination">
    <ul>
		<s:if test="#request.teacherPage.hasPrePage==true">
		<li><a href="scanteacher!frontPage.action?currentPage=<s:property value="teacherPage.currentPage" />" class="btu">上一页</a></li>
		</s:if>
		<li><a href="#" class="btu active"><s:property value="teacherPage.currentPage" /></a></li>
		<s:if test="#request.teacherPage.currentPage+1<=#request.teacherPage.totalPage">
		<li><a href="scanteacher!nextPage.action?currentPage=<s:property value="teacherPage.currentPage" />" class="btu"><s:property value="teacherPage.currentPage+1" /></a></li>
		</s:if>
		<s:if test="#request.teacherPage.currentPage+2<=#request.teacherPage.totalPage">
		<li><a href="scanteacher!nextPage.action?currentPage=<s:property value="teacherPage.currentPage+1" />" class="btu"><s:property value="teacherPage.currentPage+2" /></a></li>
		</s:if>
		<s:if test="#request.teacherPage.currentPage+3<=#request.teacherPage.totalPage">
		<li><a href="scanteacher!nextPage.action?currentPage=<s:property value="teacherPage.currentPage+2" />" class="btu"><s:property value="teacherPage.currentPage+3" /></a></li>
		</s:if>
		<s:if test="#request.teacherPage.hasNextPage==true">
		<li><a href="scanteacher!nextPage.action?currentPage=<s:property value="teacherPage.currentPage" />" class="btu">下一页</a></li>
		</s:if>
    </ul>
</div>

<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">警告</h3>
    </div>
    <div class="modal-body">
        <p class="error-text"><i class="icon-warning-sign modal-icon"></i>确定要删除这条信息吗?</p>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
        <button class="btn btn-danger" data-dismiss="modal" onclick="deleteTc();">确定</button>
    </div>
</div>

        </div>
    </div>
    </div>

  <!-- 底部 -->
  <jsp:include page="../page/button.jsp"></jsp:include> 
    
    

    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.js"></script>

  </body>
</html>

