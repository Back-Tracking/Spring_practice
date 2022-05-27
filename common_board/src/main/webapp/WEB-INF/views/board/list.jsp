<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Articles</title>

    <!-- Custom fonts for this template -->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/endor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Header Start -->
	<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
	<!-- Header End -->

    <!-- Begin Page Content -->
    <div class="container-fluid">

	    <!-- Page Heading -->
	    <h1 class="h3 mb-2 text-gray-800">Articles List</h1>
	    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
	        For more information about DataTables, please visit the <a target="_blank"
	            href="https://datatables.net">official DataTables documentation</a>.</p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
           <div class="card-header py-3">
               <h6 class="m-0 font-weight-bold text-primary">Article Example</h6>
           </div>
           <div class="card-body">
              <div class="table-responsive">
              
                  	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                      <thead>
                          <tr>
                              <th>番号</th>
                              <th>タイトル</th>
                              <th>作成者</th>
                              <th>作成日</th>
                              <th>修正日</th>
                          </tr>
                      </thead>
                      <tbody>
							<c:forEach items="${list}" var="board">
								<tr>
									<td><c:out value="${board.bno}"/></td>
									<td><a class="move" href='<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td>
									<td><c:out value="${board.writer}"/></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
								</tr>
							</c:forEach>
                       </tbody>
                   	</table>
                                
                    <!-- Search Bar -->
                    <div class='row'>
                    	<div class="col-lg-12">
                    		<form id="searchForm" action="/board/list" method="get">
                    			<select name='type'>
                    				<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : ''}"/>>オプションを選択してください。</option>
                    				<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}"/>>タイトル</option>
                    				<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}"/>>コンテンツ</option>
                    				<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}"/>>作成者</option>
                    				<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : ''}"/>>タイトル or コンテンツ</option>
                    				<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : ''}"/>>タイトル or 作成者</option>
                    				<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected' : ''}"/>>タイトル or コンテンツ or 作成者</option>
                    			</select>
                    			<input type='text' name='keyword' value='${pageMaker.cri.keyword}' />
                    			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'/>
                    			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'/>
                    			<button class='btn btn-default'>Search</button>
                    		</form>
                    	</div>
                    </div>
                    <!-- End Of Search Bar -->
                                
                    <!-- Pagination -->								
					<div class='pull-right'>
						<ul class="pagination">
							
							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous">
									<a href="${pageMaker.startPage - 1}">Previous</a>
								</li>
							</c:if>
							
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="paginate_button btn btn-default ${pageMaker.cri.pageNum == num ? "active" : "" }">
									<a href="${num}">${num}</a>
									<form id="actionForm" action="/board/list" method="get">
										<input type="hidden" name="type"    value="${pageMaker.cri.type}"/>
										<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"/>
										<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>
										<input type="hidden" name="amount"  value="${pageMaker.cri.amount}"/>
									</form>
								</li>
							</c:forEach>
							
							<c:if test="${pageMaker.next}">
								<li class="paginate_button next">
									<a href="${pageMaker.endPage + 1}">Next</a>
								</li>
							</c:if>
							
						</ul>
					</div>
					<!-- End Of Pagination -->
                </div>
            </div>
        </div>
                    
		<button type="button" class="btn btn-default"><a href="/board/register">記事作成</a></button>        
    </div>
    <!-- /.container-fluid -->
                
	<!-- Footer Start -->
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
	<!-- Footer End -->
    
    <!-- Regist Modal -->
    <div class="modal fade" id="registModal" tabindex="-1" role="dialog" aria-labelledby="registModalLabel" aria-hidden="true">
    	<div class="modal-dialog">
    		<div class="modal-content">
    			<div class="modal-header">
    				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    				<h4 class="modal-title" id="registModalLabel">Modal Title</h4>
    			</div>
    			<div class="modal-body">処理が完了されました。</div>
    			<div class="modal-footer">
    				<button class="button" class="btn btn-default" data-dismiss="modal">Close</button>
    			</div>
    		</div>
    	</div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/js/demo/datatables-demo.js"></script>
    
    <script type="text/javascript">
    	$(document).ready(function(){
    		// 処理結果
    		var result = '<c:out value="${result}"/>';
    		
    		// 検索Form
    		var searchForm = $("#searchForm");
    		
    		checkModal(result);
    		
    		function checkModal(result) {
    			
    			if (result === '') {
    				return;
    			}
    			
    			if(parseInt(result) > 0) {
    				$(".modal-body").html("記事 " + parseInt(result) + "番が登録されました。");
    			}
    			
    			$("#registModal").modal("show");
    		}
    		
    		$(".paginate_button a").on("click", function(e) {
    			e.preventDefault();
    			
    			console.log("page link click");
    			
    			$("#actionForm").find("input[name='pageNum']").val($(this).attr("href"));
    			$("#actionForm").submit();
    		});
    		
    		$(".move").on("click", function(e) {
    			e.preventDefault();
    			
    			console.log("article read click");
    			
    			$("#actionForm").append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
    			$("#actionForm").attr("action", "/board/read");
    			$("#actionForm").submit();
    		});
    		
    		$("#searchForm button").on("click", function(e){
    			
    			if(!searchForm.find("option:selected").val()){
    				alert("検索オプションを選択してください。");
    				return false;
    			}
    			
    			if(!searchForm.find("input[name='keyword']").val()){
    				alert("キーワードを入力してください。");
    				return false;
    			}
    			
    			searchForm.find("input[name='pageNum']").val("1");
    			e.preventDefault();
    			
    			searchForm.submit();
    		});
    	});
    </script>

</body>

</html>