<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="추천메뉴" name="title"/>
</jsp:include>

<style>
div.menu-test{width:50%; margin:0 auto; text-align:center;}
div.result{width:70%; margin:0 auto;}
</style>

<div id="menu-container" class="text-center">
    <!-- 1. GET / menus-->
    <div class="menu-test">
        <h4>전체메뉴조회(GET)</h4>
        <input type="button" class="btn btn-block btn-outline-success btn-send" id="btn-menus" value="전송" />
    </div>
    <div class="result" id="menus-result"></div>
    
    <hr />
    
    <script type="text/javascript">
    
    const restServerUrl = "http://localhost:10000/springboot";
    
    /**
   	 * Access to XMLHttpRequest at 'http://localhost:10000/springboot/menus' 
   	 * from origin 'http://localhost:9090' has been blocked by CORS policy: 
   	 * No 'Access-Control-Allow-Origin' header is present on the requested resource.
   	 * 
   	 * - XMLHttpRequest: 비동기를 처리하는 객체
   	 * - origin: protocol + host + port를 합쳐 부르는 말 (http:// + localhost + :9090)
     * - SOP(Same Origin Policy, 동일 근원 정책): origin이 같은 상황에서만 비동기 요청을 허락하는 정책
     * - CORS(Cross Origin Resource Sharing Policy, 교차 근원 자원 공유 정책)
     * 		: origin이 다르더라도 응답 헤어 Access-Control-Allow-Origin 값이 전달되면 자원 공유를 허락하는 정책
     * 
     * springboot 프로젝트의 MenuRestController 가서 아래 추가함
     * 	// 응답 헤더에 Access-Control-Allow-Origin: *(모든 url)
	 * 	response.addHeader("Access-Control-Allow-Origin", "*");
     * 
   	 */
     
	/**
	 * [전체 메뉴]
	 */
	 
    $("#btn-menus").click((e) => {
   		$.ajax({
//    			url: `\${restServerUrl}/menus`,
			url: `${pageContext.request.contextPath}/menu/selectAllMenu.do`,
   			method: "GET",
   			success(data) {
   				console.log(data);
   				renderMenuTable(data, "menus-result");
   			},
   			error: console.log
   		});
    });
    
	// renderMenuTable
    const renderMenuTable = (data, target) => {
    	let html = `<table class="table">
    		<tr>
    			<th>번호</th>
    			<th>음식점</th>
    			<th>메뉴</th>
    			<th>가격</th>
    			<th>타입</th>
    			<th>맛</th>
    		</tr>
    	`;
    	
    	if(data.length) { // length가 0 이상이면 true
    		// 조회된 데이터가 있는 경우
    		$(data).each((i, menu) => {
				// console.log(i, menu);
				const {id, restaurant, name, price, type, taste} = menu;
					html += `<tr>
					<td>\${id}</td>
					<td>\${restaurant}</td>
					<td>\${name}</td>
					<td>￦\${price.toLocaleString()}</td>
					<td><span class="badge badge-\${type == 'kr' ? 'primary' : type == 'jp' ? 'secondary' : 'success'} ">\${type}</span>\</td>
					<td><span class="badge badge-\${taste == 'hot' ? 'danger' : 'warning'}">\${taste}</span></td>	
				</tr>`;
    		});
    	}
    	else {
    		// 조회된 데이터가 없는 경우
    		html += `<tr><td colspan="6">조회된 결과가 없습니다.</td></tr>`;
    	}
    	
    	html += `</table>`; // 닫고

    	$(`#\${target}`).html(html); // 추가
    };
    </script>
    
	<div class="menu-test">
		<h4>추천메뉴(GET)</h4>
		<form id="menuRecommendationFrm">
			<div class="form-check form-check-inline">
				<input type="radio" class="form-check-input" name="type" id="get-no-type" value="all" checked>
				<label for="get-no-type" class="form-check-label">모두</label>&nbsp;
				<input type="radio" class="form-check-input" name="type" id="get-kr" value="kr">
				<label for="get-kr" class="form-check-label">한식</label>&nbsp;
				<input type="radio" class="form-check-input" name="type" id="get-ch" value="ch">
				<label for="get-ch" class="form-check-label">중식</label>&nbsp;
				<input type="radio" class="form-check-input" name="type" id="get-jp" value="jp">
				<label for="get-jp" class="form-check-label">일식</label>&nbsp;
			</div>
			<br />
			<div class="form-check form-check-inline">
				<input type="radio" class="form-check-input" name="taste" id="get-no-taste" value="all" checked>
				<label for="get-no-taste" class="form-check-label">모두</label>&nbsp;
				<input type="radio" class="form-check-input" name="taste" id="get-hot" value="hot" checked>
				<label for="get-hot" class="form-check-label">매운맛</label>&nbsp;
				<input type="radio" class="form-check-input" name="taste" id="get-mild" value="mild">
				<label for="get-mild" class="form-check-label">순한맛</label>
			</div>
			<br />
			<input type="submit" class="btn btn-block btn-outline-success btn-send" value="전송" >
		</form>
	</div>
	<div class="result" id="menuRecommendation-result"></div>
	
	<hr />
	
	<script type="text/javascript">
	
	/**
	 * [추천 메뉴]
	 */
	
		$(menuRecommendationFrm).submit((e) => {
			e.preventDefault(); // 폼 제출방지
			
			const type = $("[name=type]:checked", e.target).val();
			const taste = $("[name=taste]:checked", e.target).val();
			
			$.ajax({
				url: `\${restServerUrl}/menus/\${type}/\${taste}`,
				method: "GET",
				success(data){
					console.log(data);
					renderMenuTable(data, "menuRecommendation-result");
				},
				error: console.log
			});
		});
	</script>
	
    <!-- 2. POST / menu -->
	<div class="menu-test">
		<h4>메뉴 등록하기(POST)</h4>
		<form id="menuEnrollFrm">
			<input type="text" name="restaurant" placeholder="음식점" class="form-control" />
			<br />
			<input type="text" name="name" placeholder="메뉴" class="form-control" />
			<br />
			<input type="number" name="price" placeholder="가격" class="form-control" />
			<br />
			<div class="form-check form-check-inline">
				<input type="radio" class="form-check-input" name="type" id="post-kr" value="kr" checked>
				<label for="post-kr" class="form-check-label">한식</label>&nbsp;
				<input type="radio" class="form-check-input" name="type" id="post-ch" value="ch">
				<label for="post-ch" class="form-check-label">중식</label>&nbsp;
				<input type="radio" class="form-check-input" name="type" id="post-jp" value="jp">
				<label for="post-jp" class="form-check-label">일식</label>&nbsp;
			</div>
			<br />
			<div class="form-check form-check-inline">
				<input type="radio" class="form-check-input" name="taste" id="post-hot" value="hot" checked>
				<label for="post-hot" class="form-check-label">매운맛</label>&nbsp;
				<input type="radio" class="form-check-input" name="taste" id="post-mild" value="mild">
				<label for="post-mild" class="form-check-label">순한맛</label>
			</div>
			<br />
			<input type="submit" class="btn btn-block btn-outline-success btn-send" value="등록" >
		</form>
	</div>
	
	<hr />
	
	<script>
	
	/**
	 * [메뉴 등록]
	 */
	
	$(menuEnrollFrm).submit((e) => {
		
		const menu = {
			restaurant: $("[name=restaurant]", e.target).val(),
			name: $("[name=name]", e.target).val(),
			price: $("[name=price]", e.target).val(),
			type: $("[name=type]:checked", e.target).val(),
			taste: $("[name=taste]:checked", e.target).val(),
		};
		
		const jsonStr = JSON.stringify(menu);
		console.log(jsonStr);
		
		$.ajax({
			url: `\${restServerUrl}/menu`,
			data: jsonStr,
			contentType: "application/json; charset=utf-8",
			method: "POST",
			success(res){
				console.log(res);
				alert(res.msg);
			},
			error: console.log,
			complete() {
				e.target.reset(); // 폼 초기화
			}
		});
	});
	
	</script>
	
	<!-- #3. PUT -->
	<div class="menu-test">
		<h4>메뉴 수정하기(PUT)</h4>
		<p>메뉴 번호를 사용해 해당 메뉴 정보를 수정함</p>
		<form id="menuSearchFrm">
			<input type="text" name="id" placeholder="메뉴번호" class="form-control" /><br />
			<input type="submit" name="search-btn" class="btn btn-block btn-outline-primary btn-send" value="검색" >
		</form>
	
		<hr />
		<form id="menuUpdateFrm">
			<!-- where 조건절에 사용할 id를 담아둠 -->
			<input type="hidden" name="id" />
			<input type="text" name="restaurant" placeholder="음식점" class="form-control" />
			<br />
			<input type="text" name="name" placeholder="메뉴" class="form-control" />
			<br />
			<input type="number" name="price" placeholder="가격" step="1000" class="form-control" />
			<br />
			<div class="form-check form-check-inline">
				<input type="radio" class="form-check-input" name="type" id="put-kr" value="kr" checked>
				<label for="put-kr" class="form-check-label">한식</label>&nbsp;
				<input type="radio" class="form-check-input" name="type" id="put-ch" value="ch">
				<label for="put-ch" class="form-check-label">중식</label>&nbsp;
				<input type="radio" class="form-check-input" name="type" id="put-jp" value="jp">
				<label for="put-jp" class="form-check-label">일식</label>&nbsp;
			</div>
			<br />
			<div class="form-check form-check-inline">
				<input type="radio" class="form-check-input" name="taste" id="put-hot" value="hot" checked>
				<label for="put-hot" class="form-check-label">매운맛</label>&nbsp;
				<input type="radio" class="form-check-input" name="taste" id="put-mild" value="mild">
				<label for="put-mild" class="form-check-label">순한맛</label>
			</div>
			<br />
			<input type="submit" class="btn btn-block btn-outline-success btn-send" value="수정" >
		</form>
	</div>
	
	<script type="text/javascript">
	
	/**
	 * [메뉴 조회]
	 */
	
	$(menuSearchFrm).submit((e) => {
		e.preventDefault();
		
		const id = $("[name=id]", e.target).val();
		
		if(!id) return; // 아이디가 undefined라면 조기리턴
		
		$.ajax({
			url: `\${restServerUrl}/menu/\${id}`,
			method: "GET",
			success(res){
				console.log(res);
				
				// 해당 내용 updateFrm에 뿌려주기
				const $frm = $(menuUpdateFrm);
				const {id, restaurant, name, price, type, taste} = res;
				
				$("[name=id]", $frm).val(id);
				$("[name=restaurant]", $frm).val(restaurant);
				$("[name=name]", $frm).val(name);
				$("[name=price]", $frm).val(price);
				$(`[name=type][value=\${type}]`, $frm).prop("checked", true);
				$(`[name=taste][value=\${taste}]`, $frm).prop("checked", true);
			},
			error(xhr, textStatus, err){
				console.log(xhr, textStatus, err);
				if(xhr.status == 404) {
					alert("조회한 메뉴는 존재하지 않습니다: " + id);
				}
			}
		});
	});
	
	</script>
	
	<script type="text/javascript">
	
	/**
	 * [메뉴 수정]
	 */
	 
	 $(menuUpdateFrm).submit((e) => {
		e.preventDefault(); // 페이지 이동 방지
		 
// 		const menu = {
// 				id: $("[name=id]", e.target).val(),
// 				restaurant: $("[name=restaurant]", e.target).val(),
// 				name: $("[name=name]", e.target).val(),
// 				price: $("[name=price]", e.target).val(),
// 				type: $("[name=type]:checked", e.target).val(),
// 				taste: $("[name=taste]:checked", e.target).val(),
// 			};
		
		// 위와 동일하게 FormData를 이용한 Form -> js object
		const frmData = new FormData(e.target);
		console.log(frmData);
		
		const menu = {};
		
		for(let [k, v] of frmData) {
			menu[k] = v;
		}
		
		console.log(menu);
		 
		const jsonStr = JSON.stringify(menu);
	 
		 $.ajax({
			url: `\${restServerUrl}/menu`,
			method: "PUT",
			data: jsonStr, // 직렬화된 문자열, 객체 | json 문자열(@RequestBody)
			contentType: "application/json; charset=utf-8", // json 보낼거면 이것도 필수더라
			success(res) {
				console.log(res);
				alert(res.msg);
			},
			error: console.log,
			complete() {
				e.target.reset(); // 폼 초기화
			}
		 });
	 });
	 
	</script>
	
	<hr />
	
    <div class="menu-test">
    	<h4>메뉴 삭제하기(DELETE)</h4>
    	<p>메뉴 번호를 사용해 해당 메뉴 정보를 삭제함</p>
    	<form id="menuDeleteFrm">
    		<input type="text" name="id" placeholder="메뉴번호" class="form-control" /><br />
    		<input type="submit" class="btn btn-block btn-outline-danger btn-send" value="삭제" >
    	</form>
    </div>
    
 <script>
 
    $(menuDeleteFrm).submit((e) => {
    	e.preventDefault();
    	
    	const id = $("[name=id]", e.target).val();
    	if(!id) return;
    	
    	$.ajax({
    		url: `\${restServerUrl}/menu/\${id}`,
    		method: "DELETE",
    		success(res){
    			console.log(res);
    			alert(res.msg)
    		}, 
    		error: console.log,
    		complete(){
				e.target.reset();    			
    		}
    	});	
    });
    
 </script>

	
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>