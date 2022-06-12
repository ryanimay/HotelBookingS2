<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="layout/default.jsp" />
<head>
<meta charset="UTF-8">
<title>我的評論</title>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
</head>
<!-- Style -->
<link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css">

<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">   
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap4.min.css">
<!-- <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"rel="stylesheet"> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"rel="stylesheet">

<link rel="stylesheet" href="${contextRoot}/css/jquery-ui.min.css">
<link rel="stylesheet" href="${contextRoot}/css/myOrderInfoStyle.css">
 
<!------ Include the above in your HEAD tag ---------->
<style>

.tableComment{

height:60vh;

}


</style>
<body>
	<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);
	%>

	<!-- 	<div class="container mr-0"> -->
	<!-- 		<div class="d-flex flex-row-reverse"> -->

	<!-- 			<div class="p-2"> -->
	<%-- 				<a href="sortCommentByDesc?userId=${loginCustomer.userId}" style="color:#aaa;text-decoration:none;"onmouseover="this.style.color='orange';" onmouseout="this.style.color='#aaa';" >依降冪排序 <i class="fa fa-sort-amount-desc" aria-hidden="true"></i></a> --%>
	<!-- 			</div> -->

	<!-- 		</div> -->
	<!-- 	</div> -->

	<div class="container tableComment">
		<div class="row">

			<div class="col-2"></div>

			<div class="col-8 mt-5 mb-5">
				<table id="table_id"
					class="table table-striped table-bordered dt-responsive nowrap "
					style="border-radius: 5px; width: 100%;">
					<thead>
						<tr>
							<th data-field="bookingId">訂單號碼</th>
							<th data-field="comment">評論內容</th>
							<th data-field="editComment">修改</th>
							<th data-field="delComment">刪除</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="cm" items="${CommentList}">
							<tr>
								<td>${cm.bookingId}</td>
								<td>${cm.comment}</td>
								<td><a href="editComment?commentId=${cm.commentId}"><i class="fa fa-pencil"aria-hidden="true"></i></a></td>
								<td><a href="delComment?commentId=${cm.commentId}"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
	<!-- footer star-->
	<jsp:include page="layout/footer.jsp" />
	<!-- footer end-->
	<!-- Javascript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
<script src="${contextRoot}/js/jquery-ui.min.js"></script>
<script src="https://kit.fontawesome.com/ca70cd7f9d.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap4.min.js"></script>
	
	<script type="text/javascript">
		$("#table_id").DataTable(
			{

			// 參數設定[註1]
			"lengthMenu" : [ 3, 5 ],
			"pageLength" : '5',
			'responsive' : true, //預設為undefined
			 "searching": false,
			//設定欄位元素定義區塊
			language : {
				url : 'https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json'
			}
});
	</script>

</body>
</html>