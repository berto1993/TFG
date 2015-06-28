<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Imports para BootStrap -->
<script src="js/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="js/bootstrap.min.js"></script>

<!-- MENSAJE COOKIES -->
<script src="js/Cookies.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/Cookies.css">



<title>EliminarObra</title>

<script>
	function doActionTrue(id) {

		$.ajax({
			url : "EO",
			type : 'POST',
			data : {
				id : id
			},
			success : function(result) {
				if (result == 'true')
					$('tr#' + id).remove();
			},
			error : function(request, error) {

			}
		});
		//Eliminamos la linea

	}

	function doActionFalse() {

	}

	function clickEliminarObra() {
		var id = $(this).val();
		
		$('#confirm').modal({
			backdrop : 'static',
			keyboard : false
		}).one('click', '#delete', function(e) {
			doActionTrue(id);
		});

		return false;
	}
</script>

</head>
<body>

	<jsp:include page="../Cookies.html" />
	<!-- <div class="container theme-showcase" role="main"> -->

	<div class="container theme-showcase" role="main">

		<jsp:include page="title.jsp" />

		<div class="modal fade" id="confirm" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">¿Estas seguro?</h4>
					</div>
					<div class="modal-body">
						<p>¿Quieres eliminar la Obra?</p>
					</div>
					<div class="modal-footer">
						<button type="button" data-dismiss="modal" class="btn btn-primary"
							id="delete">Eliminar</button>
						<button type="button" data-dismiss="modal" class="btn">Cancelar</button>
					</div>
				</div>
			</div>
		</div>


		<c:set var="autor" value="${requestScope.autores}" scope="request"></c:set>

		<div class='jumbotron'>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Autor</th>
						<th>Fecha Inicio</th>
						<th>Ultima modificación</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="aut" items="${requestScope.obras}">
						<tr id='<c:out value="${aut.id}"></c:out>'>
							<td><c:out value="${aut.titulo}"></c:out></td>
							<td><c:out value="${autor[aut.autor]}"></c:out></td>
							<td><fmt:formatDate value="${aut.fecha_in}"
									pattern="dd/MM/yyyy" /></td>
							<td><fmt:formatDate value="${aut.fecha_mod}"
									pattern="dd/MM/yyyy" /></td>
							<td><button type="button" class='btn btn-default'
									value='<c:out value="${aut.id}"></c:out>'>Eliminar</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<script>
				$('.btn-default').on('click', clickEliminarObra);
			</script>

		</div>
	</div>
	<div id="confirm" class="modal hide fade" role="dialog">
		<div class="modal-content">
			<div class="modal-body">Delete?</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn btn-primary"
					id="delete">Delete</button>
				<button type="button" data-dismiss="modal" class="btn">Cancel</button>
			</div>
		</div>
	</div>
	</div>
</body>
</html>