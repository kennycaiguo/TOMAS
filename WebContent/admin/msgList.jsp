<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>课程列表浏览</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.css" />
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
	<div class="container">
		<form class="form-inline" action="AdminServlet?method=showMsgList" method="post">
			<div class="col-md-2"></div>
			<div class="col-md-3">
				<div class="form-group">
				    <label for="courseName">课程</label>
				    <input type="text" class="form-control" id="courseName" name="courseName" placeholder="输入课程名称">
				  </div>
			</div>
			<div class="col-md-3">
				 <div class="form-group">
				    <label for="teacherName">教师</label>
				    <input type="text" class="form-control" id="teacherName" name="teacherName" placeholder="输入教师姓名">
				  </div>
			</div>
			<div class="col-md-3">
				 <div class="form-group">
				    <label for="keywords">关键字</label>
				    <input type="text" class="form-control" id="keywords" name="keywords" placeholder="输入提问内容关键字">
				  </div>
			</div>
		  <div class="col-md-1">
		  	<button type="submit" class="btn btn-default">查询</button>
		  </div>
		</form>
		<table class="table table-striped">
			<tr align="center">
				<td>标题</td>
				<td>日期</td>
				<td>所属课程</td>
				<td>授课教师</td>
				<td>提问内容</td>
				<td colspan="2">操作</td>
			</tr>
			<c:forEach var="message" items="${ list }">
				<tr align="center">
					<td>${ message.title }</td>
					<td>${ message.date }</td>
					<td>${ message.course.cname }</td>
					<td>${ message.course.teacher.realname }</td>
					<td><a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#content${ message.mid }">查看</a></td>
					<td><a class="btn btn-primary btn-xs" href="AdminServlet?method=updateMsgUI&mid=${ message.mid }">修改</a></td>
					<td><a class="btn btn-danger btn-xs" data-toggle="modal" data-target="#delete${ message.mid }">删除</a></td>
				</tr>
				
				<div class="modal fade" id="content${ message.mid }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<h4 class="modal-title" id="myModalLabel">
									提问内容
								</h4>
							</div>
							<div class="modal-body">
								<p>${ message.content }</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭
								</button>
							</div>
						</div>
					</div>
				</div>
				
				<form  class="form-horizontal" action="AdminServlet?method=delMsg&mid=${ message.mid }" method="post">
					<div class="modal fade" id="delete${ message.mid }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
										&times;
									</button>
									<h4 class="modal-title" id="myModalLabel">
										提示
									</h4>
								</div>
								<div class="modal-body">
									<p>是否确认删除？？</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消
									</button>
									<button type="submit" class="btn btn-primary">确定 
									</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</c:forEach>
		</table>
	</div>
</body>

</html>