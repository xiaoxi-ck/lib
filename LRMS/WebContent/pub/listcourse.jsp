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
    <title>
    	<s:if test="#request.type==0">
    		查看预约记录
    	</s:if>
    	<s:if test="#request.type==1">
    		查看课表
    	</s:if>
    	<s:if test="#request.type==2">
    		未审核记录
    	</s:if>
    </title>
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
		function con(id){
			window.id=id;
		}
	</script>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-57-precomposed.png">
  </head>

  <body> 

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
            <h1 class="page-title">
            	<s:if test="#request.type==0">
		    		查看预约记录
		    	</s:if>
		    	<s:if test="#request.type==1">
		    		查看课表
		    	</s:if>
		    	<s:if test="#request.type==2">
		    		未审核记录
		    	</s:if>
            </h1>
<div class="btn-toolbar">
  <div class="btn-group">
  </div>
</div>
<div class="well">
    <table class="table">
      <thead>
        <tr>
          <th>#</th>
          <th>课程名称</th>
          <th>课程时间</th>
          <th>课节</th>
          <th>老师</th>
          <th>学生</th>
          <s:if test="#request.type==0">
		  	<th>预约状态</th>
		  </s:if>
		  <th>更多信息</th>
          <s:if test="#request.type==2">
    		<th>操作</th>
    	</s:if>
    	
        </tr>
      </thead>
      <tbody>
      	<s:iterator value="#session.courses" id="infos">
      		<tr>
	      		<td><%=++i%></td>
	      		<td><s:property value="#infos.courseName" /></td>
				<td><s:property value="#infos.year" />-<s:property value="#infos.month" />-<s:property value="#infos.day" /></td>
	          	<td><s:property value="#infos.courseNo" /></td>
	          	<td><a href="teacherservice!edit.action?id=<s:property value="#infos.teacherId" />"><s:property value="#infos.teacherName" /></a></td>
	          	<td><a href="studentservice!edit.action?id=<s:property value="#infos.studentId" />"><s:property value="#infos.studentName" /></a></td>
	          	<s:if test="#request.type==0">
		  			<s:if test="#infos.status==0">
		  				<td>未审核</td>
		  			</s:if>
		  			<s:if test="#infos.status==1">
		  				<td>审核通过</td>
		  			</s:if>
		  			<s:if test="#infos.status==2">
		  				<td>审核没有通过</td>
		  			</s:if>
		  		</s:if>
		  		<td><a href="courseservice!check.action?id=<s:property value="#infos.id" />">查看详情</a></td>
		  		<s:if test="#request.type==2">
		    		<td>
		    			<a href="" role="button" data-toggle="modal" onclick="confirm(<s:property value="#infos.id" />,1)"><i class="icon-ok"></i></a>
		    			<a href="" role="button" data-toggle="modal" onclick="confirm(<s:property value="#infos.id" />,2)"><i class="icon-remove"></i></a>
		    		</td>
		    	</s:if>
		    	<s:if test="#request.type==0">
		    		<td>
		    			<a href="#myModal" role="button" data-toggle="modal" onclick="con(<s:property value="#infos.id" />)"><i class="icon-remove"></i></a>
		    		</td>
		    	</s:if>
			</tr>
		</s:iterator>
      </tbody>
    </table>
</div>
<div class="pagination">
    <ul>
		<s:if test="#request.coursePage.hasPrePage==true">
		<li><a href="scanstudent!frontPage.action?currentPage=<s:property value="coursePage.currentPage" />" class="btu">上一页</a></li>
		</s:if>
		<li><a href="#" class="btu active"><s:property value="coursePage.currentPage" /></a></li>
		<s:if test="#request.coursePage.currentPage+1<=#request.coursePage.totalPage">
		<li><a href="scanstudent!nextPage.action?currentPage=<s:property value="coursePage.currentPage" />" class="btu"><s:property value="coursePage.currentPage+1" /></a></li>
		</s:if>
		<s:if test="#request.coursePage.currentPage+2<=#request.coursePage.totalPage">
		<li><a href="scanstudent!nextPage.action?currentPage=<s:property value="coursePage.currentPage+1" />" class="btu"><s:property value="coursePage.currentPage+2" /></a></li>
		</s:if>
		<s:if test="#request.coursePage.currentPage+3<=#request.coursePage.totalPage">
		<li><a href="scanstudent!nextPage.action?currentPage=<s:property value="coursePage.currentPage+2" />" class="btu"><s:property value="coursePage.currentPage+3" /></a></li>
		</s:if>
		<s:if test="#request.coursePage.hasNextPage==true">
		<li><a href="scanstudent!nextPage.action?currentPage=<s:property value="coursePage.currentPage" />" class="btu">下一页</a></li>
		</s:if>
    </ul>
</div>
	<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">警告</h3>
    </div>
    <div class="modal-body">
        <p class="error-text"><i class="icon-warning-sign modal-icon"></i>删除记录会导致学生无法查看记录和相关课程，您确定要删除吗?</p>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
        <button class="btn btn-danger" data-dismiss="modal" onclick="deletec();">确定</button>
    </div>
	</div>
        </div>
    </div>
    </div>

 <!-- 底部 -->
  <jsp:include page="../page/button.jsp"></jsp:include> 
    
    

    
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.js"></script>

  </body>
  <script type="text/javascript">
    function confirm(id,res)
	{
		$.post("courseservice!update.action",{'id':id,'res':res },function(result){
			if(result.stateCode==1){
				layer.msg(result.message, {icon: 4});
				window.setTimeout("window.location='${pageContext.request.contextPath}/scancourse?type=2'", 3000); 
				
			}else{
				layer.msg(result.message, {icon: 2});
			}
		},"json");
	}
    function deletec()
	{
		$.post("courseservice!delete.action",{'id':window.id},function(result){
			if(result.stateCode==1){
				layer.msg(result.message, {icon: 4});
				window.setTimeout("window.location='${pageContext.request.contextPath}/scancourse?type=0'", 3000); 
				
			}else{
				layer.msg(result.message, {icon: 2});
			}
		},"json");
	}
    </script>
</html>

