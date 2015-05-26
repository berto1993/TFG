<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>

<c:out value="${requestScope.tit}" ></c:out>
</title>
<style>
table,th,td
{
border:1px solid black;
}
</style>
</head>
<body>

<table>
<tbody>
<tr><th>Capitulo</th></tr>
<c:forEach items="${requestScope.chapterList}" var="emp">
<td><a href ="VerHistoria?op=1&hi=<c:out value="${requestScope.id}"></c:out>&ca=<c:out value="${emp.id}"></c:out>" ><c:out value="${emp.nombre}"></c:out></a></td>
<c:if test="${emp.id eq requestScope.chapter}">
<c:set var="chap" value="${emp}" scope="request"></c:set>
</c:if>
</tr>
</c:forEach>
</tbody>
</table>

<div id="historia">

<h1><c:out value="${chap.nombre}"></c:out></h1>
<c:forEach items="${chap.text}" var="par">
<p>
<c:out value="${par}"></c:out>
</p>
</c:forEach>
<c:if test="${chap.imagen ne null}">
<img alt="imagen capítulo" src="<c:out value="${chap.imagen}"></c:out>">
</c:if>
</div>

</body>
</html>