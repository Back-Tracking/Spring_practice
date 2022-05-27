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

    <title>SB Admin 2 - Read</title>

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
        <h1 class="h3 mb-2 text-gray-800">Board Read</h1>
        <p class="mb-4">Read the articles</p>
        
        <!-- Register Contents -->
        <div class="col-lg-12">
        	<div class="panel panel-default">
        		<!-- Panel Heading -->
        		<div class="panel-heading">Board Read</div>
        		
        		<br/>
        		
        		<!-- Panel Body -->
        		<div class="panel-body">
       				<!-- Title -->
       				<div class="form-group">
       					<label>Bno</label>
       					<input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly>
       				</div>
       				
       				<div class="form-group">
       					<label>Title</label>
       					<input class="form-control" name="title" value='<c:out value="${board.title}"/>' readonly>
       				</div>
       				
       				<!-- Content -->
       				<div class="form-group">
       					<label>Content</label> 
       					<textarea class="form-control" rows="3" name="content" readonly><c:out value="${board.content}" /></textarea>
       				</div>
       				
       				<!-- Writer -->
       				<div class="form-group">
       					<label>Writer</label> 
       					<input class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly></input>
       				</div>
       				
       				<div class='row'>
       					<div class='col-lg-12'>
       						<div class="panel panel-default">
       							<div class="panel-heading">
       								<i class="fa fa-comments fa-fw"></i> Reply
       								<button id='addReplyBtn' style="float:right;" class='btn btn-primary btn-xs pull-right'>New Reply</button>
       							</div>
       							
       							<div class="panel-body">
       								<ul class="chat">
       									<li class="left clearfix" data-rno='12'>
       										<div class="header">
       											<strong class="primary-font">user00</strong>
       											<small class="pull-right text-muted">2018-01-01 13:13</small>
       										</div>
       										<p>Good job!</p>
       									</li>
       								</ul>
       							</div>
       						</div>
       					</div>
       				</div>
       				
       				<form id="operForm" action="/board/modify" method="get">
        				<button data-oper="modify" class="btn btn-default">
        					<a href="/board/modify?bno=<c:out value="${board.bno}"/>">Modify</a>
        				</button>
        				<button data-oper="list" class="btn btn-default">
        					<a href="/board/list">List</a>
        				</button>
        				
        				<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/>'/>
        				<input type="hidden" name="type"    value='<c:out value="${cri.type}"/>'/>
						<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'/>
        				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'/>
        				<input type="hidden" name="amount"  value='<c:out value="${cri.amount}"/>'/>
        			</form>
        		</div>
        	</div>
        </div>
    
    </div>
    <!-- /.container-fluid -->

	<!-- Footer Start -->
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
	<!-- Footer End -->
    
    <!-- Comment Modal -->
    <div class="modal fade" id="commentModal" tabindex="-1" role="dialog" aria-labelledby="commentModalLabel" aria-hidden="true">
    	<div class="modal-dialog">
    		<div class="modal-content">
    			<div class="modal-header">
                    <h5 class="modal-title" id="commentModalLabel">Reply Modal</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
    			</div>
    			<div class="modal-body">
    				<div class="form-group">
    					<label>Reply</label>
    					<input class="form-control" name='reply' value='New Reply'/>
    				</div>
    				<div class="form-group">
    					<label>Replyer</label>
    					<input class="form-control" name='replyer' value='replyer'/>
    				</div>
    				<div class="form-group">
    					<label>ReplyDate</label>
    					<input class="form-control" name='replyDate' value=''/>
    				</div>
    			</div>
    			<div class="modal-footer">
                    <button id='modalModBtn'      class="btn btn-warning" type="button">Modify</button>
                    <button id='modalRemoveBtn'   class="btn btn-danger"  type="button">Remove</button>
                    <button id='modalRegisterBtn' class="btn btn-primary" type="button">Register</button>
                    <button id='modalCloseBtn'    class="btn btn-default" type="button" data-dismiss="modal">Close</button>
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
    
    <!-- Comment Handling scripts -->
    <script type="text/javascript" src="/resources/js/reply.js"></script>

	<script type="text/javascript">
	$(document).ready(function(){
		
		var bnoValue = '<c:out value="${board.bno}" />';
		var replyUL = $(".chat");
		
		showList(1);
		
		// コメント表示イベント
		function showList(page){
			replyService.getList({bno:bnoValue,page:page||1}, function(list){
				var str="";
				if(list == null || list.length == 0){
					replyUL.html("");
					
					return;
				}
				
				for(var i=0, len=list.length||0; i<len; i++) {
					str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str += "<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
					str += "<small class='pull-right text-muted'> "+replyService.displayTime(list[i].replyDate)+"</small></div>";
					str += "<p>"+list[i].reply+"</p></div></li>";
				}
				
				replyUL.html(str);
			});
		}
		
		// モーダルの入力要素
		var modal = $(".modal");
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplyDate = modal.find("input[name='replyDate']");
		
		// モーダルのボタンオブジェクト
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		// モーダル表示処理
		$("#addReplyBtn").on("click", function(e){
			modal.find("input").val("");
			modalInputReplyer.removeAttr("readonly");
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id != 'modalCloseBtn']").hide();
			
			modalRegisterBtn.show();
			
			$("#commentModal").modal("show");
		});
		
		// コメント登録処理
		modalRegisterBtn.on("click", function(e){
			
			var reply = {
				reply: modalInputReply.val(),
				replyer: modalInputReplyer.val(),
				bno: bnoValue
			};
			replyService.add(reply, function(result){
				alert(result);
				
				modal.find("input").val("");
				modal.modal("hide");
				
				showList(1);
			});
		});
		
		// コメント修正処理	
		modalModBtn.on("click", function(e){
			
			var reply = {rno:modal.data("rno"), reply:modalInputReply.val()};
			
			replyService.update(reply, function(result){
				
				alert(result);
				modal.modal("hide");
				showList(1);
			});
		});
		
		// コメント削除処理
		modalRemoveBtn.on("click", function(e){
			
			var rno = modal.data("rno");
			
			replyService.remove(rno, function(result){

				alert(result);
				modal.modal("hide");
				showList(1);
			});
		});
		
		// コメントクリックイベント
		replyUL.on("click", "li", function(e){
			var rno = $(this).data("rno");
			
			replyService.get(rno, function(reply){
				
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer);
				modalInputReplyer.attr("readonly","readonly");
				modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly","readonly");
				modal.data("rno", reply.rno);
				
				modal.find("button[id != 'modalCloseBtn']").hide();
				modalInputReplyDate.closest("div").show();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				$("#commentModal").modal("show");
			})
		});
		
		var operForm = $("#operForm");
		
		// 画面遷移関連スクリプト
		$("button[data-oper='modify']").on("click", function(e) {
			e.preventDefault();
			
			operForm.attr("action", "/board/modify").submit();
		});
		$("button[data-oper='list']").on("click", function(e) {
			e.preventDefault();
			
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list");
			operForm.submit();
		});
		
		//reply.jsの動作確認
		//console.log("=================");
		//console.log("JS TEST");
		
		/* コメント投稿の動作確認
		replyService.add(
			{reply:"JS TEST", replyer:"tester", bno:bnoValue},
			function(result){
				alert("RESULT : " + result);
			}
		);
		*/
		
		/* コメントリスト取得の動作確認
		replyService.getList({bno:bnoValue, page:1}, function(list){
			
			for(var i = 0, len = list.length||0; i < len; i++) {
				console.log(list[i]);
			}
		});
		*/
		
		/* コメント削除の動作確認
		replyService.remove(12, function(count) {
			
			console.log(count);
			
			if (count === "success") {
				alert("REMOVED");
			}
		}, function(err) {
			alert("ERROR...");
		});
		*/
		
		/* コメント修正の動作確認
		replyService.update({
			rno : 6,
			bno : bnoValue,
			reply : "Ajax処理によって修正されたコメントです。"
		}, function(result) {
			alert("修正完了。");
		});
		*/
		
		/* 単一コメント取得の動作確認
		replyService.get(7, function(data){
			console.log(data);
		});
		*/
	});
	</script>
</body>
</html>