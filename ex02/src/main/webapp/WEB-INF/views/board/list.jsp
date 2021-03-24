<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<%@include file ="/WEB-INF/views/includes/header.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4"></p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3" >
                            <h6 class="m-0 mt-2 font-weight-bold text-primary" style="width:50%; float:left">Board List Page</h6>
                            <button id='regBtn' type="button" class="btn btn-xs pull-right" style="float:right">Register New Board</button>
                        </div>
                        
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>#번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>수정일</th>
                                        </tr>
                                    </thead>
                              		<c:forEach items="${list }" var ="board">
                              		<tr>
                              			<td><c:out value = "${board.bno}"/></td>
                              			<td><a class = 'move' href='<c:out value="${board.bno}"/>'> 
                              				<c:out value = "${board.title}"/></a></td>
                              			<td><c:out value = "${board.writer}"/></td>
                              			<td><fmt:formatDate pattern="yyyy-MM-dd" value ="${board.regdate}"/></td>
                              			<td><fmt:formatDate pattern="yyyy-MM-dd" value ="${board.updateDate}"/></td>
                              		</tr>
                              		</c:forEach>
                                </table>
                                <div class='row' style="width:100%;">
                                	<div class='col-lg-10'>
										<form id='searchForm' action='/board/list' method='get'>
											<select class = 'custom-select-sm' name='type'>
												<option value="" <c:out value="${pageMaker.cri.type==null?'selected':''}"/>>--</option>
												<option value="T"<c:out value="${pageMaker.cri.type=='T' ?'selected':''}"/> >제목</option>
												<option value="C"<c:out value="${pageMaker.cri.type=='C'?'selected':''}"/>>내용</option>
												<option value="W"<c:out value="${pageMaker.cri.type=='W'?'selected':''}"/>>작성자</option>
												<option value="TC"<c:out value="${pageMaker.cri.type=='TC'?'selected':''}"/>>제목 or 내용</option>
												<option value="TW"<c:out value="${pageMaker.cri.type=='TW'?'selected':''}"/>>제목 or 작성자</option>												<option value="TWC"<c:out value="${pageMaker.cri.type=='TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option> --%>
											
											</select>
											<input type='text' name='keyword' value ='<c:out value="${pageMaker.cri.keyword==null ? '': pageMaker.cri.keyword}"/>'>				
			                				<input type ='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
            					    		<input type ='hidden' name='amount' value='${pageMaker.cri.amount}'>             
											<button class='btn btn-primary'>Search</button>
										</form>
                                	</div>
                                </div>
                                
                                
								<nav aria-label="Page navigation example">
								  <ul class="pagination justify-content-end">
								    <c:if test="${pageMaker.prev}">
								    <li class="page-item previous">
								      <a class="page-link" href="${pageMaker.startPage-1}" tabindex="-1">Previous</a>
								    </li>								    
								    </c:if>
								    <c:forEach var ="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
								    	<li class="page-item ${pageMaker.cri.pageNum==num ? "active" :""}"><a class="page-link" href="${num}">${num}</a></li>
								    </c:forEach>
								    <c:if test="${pageMaker.next}">
								    <li class="page-item next">
								      <a class="page-link" href="${pageMaker.endPage+1 }" tabindex="-1">Next</a>
								    </li>								    
								    </c:if>
								  </ul>
								</nav>
								
								
								
								
                                <!-- Modal -->
							    <div class="modal fade" id="MyModal" tabindex="-1" role="dialog" aria-labelledby="MyModalLabel"
							        aria-hidden="true">
							        <div class="modal-dialog">
							            <div class="modal-content">
							                <div class="modal-header">
							                    <h5 class="modal-title" id="myModalLabel">Modal Title</h5>
							                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
							                        <span aria-hidden="true">×</span>
							                    </button>
							                </div>
							                <div class="modal-body">처리가 완료되었습니다.</div>
							                <div class="modal-footer">
							                    <button class="btn btn-default" type="button" data-dismiss="modal">Close</button>
							                    <button class="btn btn-primary" type="button" >Save Changes</button>
							                </div>
							            </div>
							        </div>
							    </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
                <form id='actionForm' action = "/board/list" method ='get'>
                	<input type ='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                	<input type ='hidden' name='amount' value='${pageMaker.cri.amount}'>
                	<input type ='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
                	<input type ='hidden' name='keyword'value='<c:out value="${pageMaker.cri.keyword}"/>'>
                </form>
                
                
                
<script type="text/javascript">
	$(document).ready(function(){
		var result = '<c:out value="${result}"/>';
		
		checkModal(result);
		
		//history.replaceState({},null,null); TODO : 모달문제처리
		
		function checkModal(result){
			
			if(result ===''
					//|| hisotry.state
					){
				return;
			}
			if(parseInt(result)>0){
				$(".modal-body").html("게시글 "+parseInt(result)+" 번이 등록되었습니다.");
			}
			$("#MyModal").modal("show");
		}
		
		$("#regBtn").on("click",function(){
			self.location="/board/register";
		});
		
		var actionForm = $("#actionForm");
		$(".page-item a").on("click",function(e){
			e.preventDefault();
			console.log($(this).attr("href"));
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".move").on("click",function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+
							$(this).attr("href")+"'>");
			actionForm.attr("action","/board/get");
			actionForm.submit();
		})
		
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click",function(e){
			if(!searchForm.find("option:selected").val()){
				alert("검색종류를 선택하세요");
				return false;
			}
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDeFault();
			searchForm.submit();
		})
	});
	
</script>
                
<%@include file ="/WEB-INF/views/includes/footer.jsp"%>

