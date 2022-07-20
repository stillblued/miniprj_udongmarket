<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>communitySearchList</title>
<script src="js/jquery-3.6.0.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.do">메인</a></li>
				<li><a href="dealList.do">장터</a></li>
				<li class="active"><a href="communityList.do">커뮤니티</a></li>
			</ul>
		</div>
	</nav>


	<div align="center">
		<div>
			<h1>검색 결과</h1>
		</div>

		<br>

		<div>
			<table border="1" id="table">
				<thead>
					<tr>
						<th width="70">#</th>
						<th width="450">제목</th>
						<th width="70">작성자</th>
						<th width="170">작성일</th>
					</tr>
				</thead>
				<tbody id="tb">


					<c:if test="${empty list}">
						<td colspan="6" align="center">검색 결과가 없습니다.</td>
					</c:if>
					<c:if test="${not empty list}">
						<c:forEach var="list" items="${list}">
							<tr onclick="location.href='communityDetail.do'">
								<td>${list.comCategory }</td>
								<td>${list.comTitle }</td>
								<td>${list.nickname }</td>
								<td>${list.comDate }</td>
							</tr>


						</c:forEach>
					</c:if>

				</tbody>
			</table>
		</div>

		<br>
		<div id="nav">
			<div id="page">
				<%
				int pageCount = (int) request.getAttribute("pageCount");
				int pageBlock = (int) request.getAttribute("pageBlock");
				int startPage = (int) request.getAttribute("startPage");
				int endPage = (int) request.getAttribute("endPage");
				String key = (String)request.getAttribute("key");
				String val = (String)request.getAttribute("val");

				for (int i = startPage; i <= endPage; i++) {
				%>
				<a href="communitySearch.do?key=<%=key%>&val=<%=val%>&pageNum=<%=i%>"><%=i%></a>
				<%
				}
				%>
			</div>
		</div>
		<br>

	</div>




</body>
</html>