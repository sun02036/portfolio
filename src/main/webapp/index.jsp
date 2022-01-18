<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8"/>

<!-- \${param.title} -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="JSJ's Portfolio" name="title"/> 
</jsp:include>

<div class="slider-area ">
	<div class="slider-active slick-initialized slick-slider">

		<div class="slick-list draggable">
			<div class="slick-track" style="opacity: 1; width: 3806px;">
				<div
					class="single-slider slider-height d-flex align-items-center slick-slide slick-current slick-active"
					data-slick-index="0" aria-hidden="false" tabindex="0"
					style="width: 1903px; position: relative; left: 0px; top: 0px; z-index: 999; opacity: 1;">
					<div class="container">
						<div class="row">
							<div class="col-xl-6 col-lg-6 col-md-8">
								<div class="hero__caption">
									<h1 data-animation="fadeInUp" data-delay=".6s" class=""
										style="animation-delay: 0.6s;">
										I'm Ji Sujin,
										<br /> 
										a web developer !
										</h1>
									<p data-animation="fadeInUp" data-delay=".8s" class=""
										style="animation-delay: 0.8s;">
									안녕하세요. 매일 성장하는 백엔드 개발자 지수진입니다.
									<br />
									매우 꼼꼼한 성격, 원만한 인간관계, 성실한 성격이 저의 장점입니다. 	
									</p>

									<div class="hero__btn">
										<a class="btn hero-btn" id="learn-btn">Learn More</a> 
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<article class="AboutMe_AboutMe__1TCRF" id="about-me">
	<div class="AboutMe_content__2uEf5">
		<div class="SectionTitle_SectionTitle__3f_lU">
			<div class="SectionTitle_text__hWi93"
				style="color: #000000; border-bottom-color: #D95B5B;">ABOUT ME</div>
			<div class="SectionTitle_link-wrapper__3yMsW">
				<img class="SectionTitle_link__3A4rU" src="/images/black-link.png"
					alt="">
			</div>
		</div>
		<div class="AboutMe_basic-infos__36Rb0">
			<div class="AboutMe_basic-info-wrapper__3E-0e">
				<div class="AboutMe_basic-info__3sjma">
					<div class="AboutMe_field__5L2Lm">
						<div class="AboutMe_field-label__1B57s">이름</div>
						<div class="AboutMe_field-value__qT3Li">지수진</div>
					</div>
				</div>
			</div>
			<div class="AboutMe_basic-info-wrapper__3E-0e">
				<div class="AboutMe_basic-info__3sjma">
					<div class="AboutMe_field__5L2Lm">
						<div class="AboutMe_field-label__1B57s">생년월일</div>
						<div class="AboutMe_field-value__qT3Li">95.09.22</div>
					</div>
				</div>
			</div>
			<div class="AboutMe_basic-info-wrapper__3E-0e">
				<div class="AboutMe_basic-info__3sjma">
					<div class="AboutMe_field__5L2Lm">
						<div class="AboutMe_field-label__1B57s">연락처</div>
						<div class="AboutMe_field-value__qT3Li">010-8960-4543</div>
					</div>
				</div>
			</div>
			<div class="AboutMe_basic-info-wrapper__3E-0e">
				<div class="AboutMe_basic-info__3sjma">
					<div class="AboutMe_field__5L2Lm">
						<div class="AboutMe_field-label__1B57s">이메일</div>
						<div class="AboutMe_field-value__qT3Li">
							<a class="AboutMe_email__38blp" href="mailto:sun02036@naver.com">sun02036@naver.com</a>
						</div>
					</div>
				</div>
			</div>
			<div class="AboutMe_basic-info-wrapper__3E-0e">
				<div class="AboutMe_basic-info__3sjma">
					<div class="AboutMe_field__5L2Lm">
						<div class="AboutMe_field-label__1B57s">학력</div>
						<div class="AboutMe_field-value__qT3Li">
							신한대학교<br>(간호학과)
						</div>
					</div>
				</div>
			</div>
			<div class="AboutMe_basic-info-wrapper__3E-0e">
				<div class="AboutMe_basic-info__3sjma">
					<div class="AboutMe_field__5L2Lm">
						<div class="AboutMe_field-label__1B57s">수료</div>
						<div class="AboutMe_field-value__qT3Li">KH정보교육원</div>
						<div>2021.06.14 ~ 2022.01.14</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</article>

<article class="Skills_Skills__30WZi" id="skills">
	<div class="Skills_content__1b1wq">
		<div class="SectionTitle_SectionTitle__3f_lU">
			<div class="SectionTitle_text__hWi93"
				style="color: #000000; border-bottom-color: #D95B5B;">SKILLS</div>
			<div class="SectionTitle_link-wrapper__3yMsW">
				<img class="SectionTitle_link__3A4rU" src="/images/black-link.png"
					alt="">
			</div>
		</div>
		<div class="Skills_tech-stacks-container__3SGhh">
			<div class="Skills_tech-stacks__3WypH" style="border: 1px solid whitesmoke;">
				<img class="Skills_img__AYqwK" src="https://i.imgur.com/DTmKkYy.png"
					alt="">
			</div>
		</div>
	</div>
</article>

<article class="Archiving_Archiving__3P8w6" id="archiving">
	<div class="Archiving_content__1Mmrq">
		<div class="SectionTitle_SectionTitle__3f_lU">
			<div class="SectionTitle_text__hWi93"
				style="color: black; border-bottom-color: #D95B5B;">ARCHIVING</div>
			<div class="SectionTitle_link-wrapper__3yMsW">
				<img class="SectionTitle_link__3A4rU" src="/images/white-link.png"
					alt="">
			</div>
		</div>
		<div class="Archiving_container__2BGDS">
			<div class="Archiving_git-hub__2Y84_">
				<div class="Archiving_img-wrapper__k3fGq">
					<img class="Archiving_img___WoR6"
						src="https://i.imgur.com/9YO7x7N.png" alt="" style="margin-left: 83px !important; width: 180px;">
				</div>
				<a class="Archiving_url__3mKKs" href="https://github.com/sun02036/sun02036.github.io">github.com/sun02036</a>
				<div class="Archiving_description__JIcXz">
					<p>
						<b style="color: #D95B5B;">소스 코드 저장소</b>입니다.
					</p>
					<ul style="list-style: none;">
						<li>프로젝트 소스 코드</li>
						<li>수강한 수업들의 코딩 과제 소스 코드</li>
					</ul>
				</div>
			</div>
			<div class="Archiving_tistory__3NpTZ">
				<div class="Archiving_img-wrapper__k3fGq">
					<img class="Archiving_img___WoR6"
						src="https://i.imgur.com/XEEuXLv.png" alt="" style="margin-left: 83px;">
				</div>
				<a class="Archiving_url__3mKKs" href="https://www.notion.so/jjsjjj09/">notion.so/jjsjjj09</a>
				<div class="Archiving_description__JIcXz">
					<p>
						<b style="color: #D95B5B;">공부 및 지식 공유 목적의 블로그</b>입니다.
					</p>
					<ul style="list-style: none;">
						<li>공부한 내용을 나의 것으로 만들기 위한 기록</li>
						<li>웹 개발자의 길을 걸으며 공부한 웹 관련 지식 정리</li>
						<li>학원 수업들의 내용 복습 겸 정리</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</article>

<article class="Projects_Projects__KtiS7" id="projects">

	<div class="Projects_content__2sdEt">
		<div class="SectionTitle_SectionTitle__3f_lU">
			<div class="SectionTitle_text__hWi93"
				style="color: black; border-bottom-color: #D95B5B;">PROJECTS</div>
			<div class="SectionTitle_link-wrapper__3yMsW">
				<img class="SectionTitle_link__3A4rU" src="/images/white-link.png"
					alt="">
			</div>
		</div>
		
		<!-- 개인 프로젝트 -->
		<div class="Projects_projects__234Pm">
			<div class="Projects_project__3InD_">
				<div class="Projects_title__20T9r">My Website (자기소개 페이지)</div>
				<div class="Projects_period__1fnvs">
					2021.09&nbsp;<span class="Projects_new-line-chunk__2nDnY">(1人 개인 프로젝트)</span>
				</div>
				
				<div class="Projects_info__1vwgW">
					<div id="carouselExampleIndicators1" class="carousel slide" data-ride="carousel">
					  <ol class="carousel-indicators">
					    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
					  </ol>
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img class="d-block w-100" src="https://i.imgur.com/brfNsJQ.png" alt="">
					    </div>
					    <div class="carousel-item">
					      <img class="d-block w-100" src="https://i.imgur.com/HzYpcBx.png" alt="">
					    </div>
					    <div class="carousel-item">
					      <img class="d-block w-100" src="https://i.imgur.com/NUJXe4G.png" alt="">
					    </div>
					    <div class="carousel-item">
					      <img class="d-block w-100" src="https://i.imgur.com/td6KZE5.png" alt="">
					    </div>
					    <div class="carousel-item">
					      <img class="d-block w-100" src="https://i.imgur.com/au8Rhtp.png" alt="">
					    </div>
					  </div>
					  <a class="carousel-control-prev" href="#carouselExampleIndicators1" role="button" data-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="carousel-control-next" href="#carouselExampleIndicators1" role="button" data-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
					</div>
					
					<div class="Projects_descriptions__1DeYX">
						<div class="Projects_main-description__3lCkI">
							<b>나에 대해 소개하는 웹사이트</b>입니다.
							저에 대한 소개와 취미 그리고 간단한 자기소개가 담겨있습니다.
							<p></p>
							<span class="Projects_red__2npyK">처음 진행했던 프로젝트</span>였기에 기억이 많이 남습니다.
							처음 해보는 터라 많은 기능 없이 회원가입, 로그인 만을 구현하였지만, 저의 개성이 많이 담긴 페이지라서
							애착이 많이 갑니다.
							<p></p>
							HTML, CSS, JS로 간단하게 이루어졌지만, 홈페이지의 구색을 갖출 수 있어 굉장히 신기했던 기억이 남아 있습니다. 
							<p></p>
						</div>
						<div class="Projects_description__YKRcz">
							<div class="Projects_label__1B9QH">GitHub</div>
							<div class="Projects_value__148t7">
								<div class="Projects_url__2unkJ" onclick="location.href='https://github.com/sun02036/sun02036.github.io'">https://github.com/sun02036/sun02036.github.io</div>
							</div>
						</div>
						<div class="Projects_description__YKRcz">
							<div class="Projects_label__1B9QH">도메인</div>
							<div class="Projects_value__148t7">
								<div class="Projects_url__2unkJ" onclick="location.href='https://sun02036.github.io/'">https://sun02036.github.io/</div>
							</div>
						</div>
						<div class="Projects_description__YKRcz">
							<div class="Projects_label__1B9QH">개발환경</div>
							<div class="Projects_value__148t7">HTML, CSS, JS, VSC</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 세미 프로젝트 -->
			<div class="Projects_project__3InD_">
				<div class="Projects_title__20T9r">KHrent (렌트카 예약 웹사이트)</div>
				<div class="Projects_period__1fnvs">
					2021.10 - 2021.11&nbsp;<span class="Projects_new-line-chunk__2nDnY">(4人 팀 프로젝트)</span>
				</div>
				
				<div class="Projects_info__1vwgW">
					
					<div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel">
					  <ol class="carousel-indicators">
					    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
					  </ol>
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img class="d-block w-100" src="https://i.imgur.com/JVwrirO.png" alt="">
					    </div>
					    <div class="carousel-item">
					      <img class="d-block w-100" src="https://i.imgur.com/C7Rtesb.png" alt="">
					    </div>
					    <div class="carousel-item">
					      <img class="d-block w-100" src="https://i.imgur.com/RwC1ytg.png" alt="">
					    </div>
					    <div class="carousel-item">
					      <img class="d-block w-100" src="https://i.imgur.com/RVaDfl5.png" alt="">
					    </div>
					    <div class="carousel-item">
					      <img class="d-block w-100" src="https://i.imgur.com/ES6ToGZ.png" alt="">
					    </div>
					  </div>
					  <a class="carousel-control-prev" href="#carouselExampleIndicators2" role="button" data-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="carousel-control-next" href="#carouselExampleIndicators2" role="button" data-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
					</div>

					<div class="Projects_descriptions__1DeYX">
						<div class="Projects_main-description__3lCkI">
							<span class="Projects_red__2npyK">세미 프로젝트</span>로 진행한 <b>렌트카 예약 웹사이트</b>입니다. 
							어떤 주제로 가야 하나 정말 고민이 많았습니다.
							팀원분들과 오랜 상의 끝에 종류도 다양하고 예약까지 보여줄 수 있어 시각적 즐거움이 좋다는 판단하에
							렌트카 예약 웹사이트로 진행하였습니다.
							<p></p>
							JDBC의 구조에 대해 배우고 진행했던 프로젝트이자 
							처음으로 진행하는 팀 프로젝트이기도 했습니다.
							우연치 않게 팀원분들을 이끌고 가야 하는 상황이 오기도 했고,
							프로젝트 진행 도중 팀원분의 중도 포기로 당황스럽기도 했지만
							원활한 소통으로 다 같이 화이팅 하니 좋은 결과물이 나온 것 같습니다.
							<p></p>
							또 결제 시스템이나 카카오맵 등의 API를 구현할 때나
							AJAX를 얼마 배우지 않고 들어온 프로젝트여서 AJAX를 사용할 때면
							모든 팀원이 너무 신기해하고 축하해줬던 기억이 떠오릅니다. 
							<p></p>
							최대한 '실제 페이지처럼 구현해보자'가 목표였습니다. 그러다 보니 CSS에 굉장히 공이 많이 들어간
							결과물입니다. 
							또한 직접 부딪히면서 겪는 상황들이 많은 발전을 안겨준 작업이었습니다. 
						</div>
						<div class="Projects_description__YKRcz">
							<div class="Projects_label__1B9QH">주요 기능</div>
							<div class="Projects_value__148t7">렌트카 예약 및 결제, BEST5, 관리자 페이지</div>
						</div>
						<div class="Projects_description__YKRcz">
							<div class="Projects_label__1B9QH">GitHub</div>
							<div class="Projects_value__148t7">
								<div class="Projects_url__2unkJ" onclick="location.href='https://github.com/sun02036/khrent'">github.com/sun02036/khrent</div>
							</div>
						</div>
						<div class="Projects_description__YKRcz">
							<div class="Projects_label__1B9QH">도메인</div>
							<div class="Projects_value__148t7">
								<div class="Projects_url__2unkJ"></div>
								<a href="https://onepick-pt.com"></a>
							</div>
						</div>
						<div class="Projects_description__YKRcz">
							<div class="Projects_label__1B9QH">개발환경</div>
							<div class="Projects_value__148t7">JAVA, ORACLE, HTML, CSS, JS, JQuery, AJAX, Eclipse</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="Projects_project__3InD_">
				<div class="Projects_title__20T9r">ITFF(Information Technology Film Festival)</div>
				<div class="Projects_period__1fnvs">
					2021.12 - 2022.01&nbsp;<span class="Projects_new-line-chunk__2nDnY">(6人
						파이널 프로젝트)</span>
				</div>
				<div class="Projects_info__1vwgW">
				
					<div id="carouselExampleIndicators3" class="carousel slide" data-ride="carousel">
					  <ol class="carousel-indicators">
					    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
					  </ol>
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img class="d-block w-100" src="https://i.imgur.com/uzPU6Z7.png" alt="">
					    </div>
					    <div class="carousel-item">
					      <img class="d-block w-100" src="https://i.imgur.com/enMBQ7g.png" alt="">
					    </div>
					    <div class="carousel-item">
					      <img class="d-block w-100" src="https://i.imgur.com/6YPNXC9.png" alt="">
					    </div>
					    <div class="carousel-item">
					      <img class="d-block w-100" src="https://i.imgur.com/Xm6KCjW.png" alt="">
					    </div>
					    <div class="carousel-item">
					      <img class="d-block w-100" src="https://i.imgur.com/G22VFWn.png" alt="">
					    </div>
					    <div class="carousel-item">
					      <img class="d-block w-100" src="https://i.imgur.com/BjiwEgc.png" alt="">
					    </div>
					    <div class="carousel-item">
					      <img class="d-block w-100" src="https://i.imgur.com/8qqRdXi.png" alt="">
					    </div>
					  </div>
					  <a class="carousel-control-prev" href="#carouselExampleIndicators3" role="button" data-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="carousel-control-next" href="#carouselExampleIndicators3" role="button" data-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
					</div>
					
					<div class="Projects_descriptions__1DeYX">
						<div class="Projects_main-description__3lCkI">
							<span class="Projects_red__2npyK">파이널 프로젝트</span>로 진행한 <b>영화제 웹사이트</b>입니다. 
							스프링으로 작업한 첫 프로젝트이기도 합니다.
							파이널 프로젝트 역시 주제 선정이 곤란했습니다.
							다른 조들은 면접, 취업에 대한 주제들이 공통으로 겹쳐 우리 조는 특별하게 가보자 하여 진행했습니다.
							주제가 영화다 보니 즐겁게 만들어낼 수 있었던 것 같습니다.
							<p></p>
							영화 예매를 실제로 진행할 수 있고, 굿즈 구매를 할 수 있습니다.
							또한 티켓 나눔터에서 티켓 양도를 진행하며 회원들 간의 소통을 키워낸 페이지로 만들었습니다.
							<p></p>
							스프링이 너무 낯설어서 이 프로젝트를 완성할 수 있을까에 대한 불안감이 매우 컸습니다.
							하지만 역시 세미 때와 마찬가지로 직접 부딪혀 보니 알게 되는 것들이 정말 많았습니다.
							<p></p>
							또한 수업 때 너무 어렵게 느껴졌던 websocket도 직접 부딪혀보며 차근차근 따라가니
							구현에 성공해서 너무 기뻤던 기억이 떠오릅니다. 
						</div>
						<div class="Projects_description__YKRcz">
							<div class="Projects_label__1B9QH">주요 기능</div>
							<div class="Projects_value__148t7">영화 예매, 굿즈 구매, 활동 개별 알림, 채팅, 관리자 페이지</div>
						</div>
						<div class="Projects_description__YKRcz">
							<div class="Projects_label__1B9QH">GitHub</div>
							<div class="Projects_value__148t7">
								<div class="Projects_url__2unkJ" onclick="location.href='https://github.com/sun02036/ITFF'">github.com/sun02036/ITFF</div>
							</div>
						</div>
						<div class="Projects_description__YKRcz">
							<div class="Projects_label__1B9QH">도메인</div>
							<div class="Projects_value__148t7">
								<div class="Projects_url__2unkJ"></div>
							</div>
						</div>
						<div class="Projects_description__YKRcz">
							<div class="Projects_label__1B9QH">개발환경</div>
							<div class="Projects_value__148t7">JAVA, ORACLE, HTML, CSS, JS, JQuery, AJAX, BootStrap, Spring Framework, Spring Security, WebSocket</div>
						</div>
					</div>
				</div>
			</div>
			
			
			
		</div>
	</div>
</article>

<div class="PageUpButton_PageUpButton___HkTE ">
	<img class="PageUpButton_img__1L2at" src="/images/page-up.svg" alt="">
</div>

<script>

    const button1 = document.getElementById('about-btn');
    const section1 = document.getElementById('about-me');

    const button2 = document.getElementById('skills-btn');
    const section2 = document.getElementById('skills');

    const button3 = document.getElementById('arch-btn');
    const section3 = document.getElementById('archiving');

    const button4 = document.getElementById('projects-btn');
    const section4 = document.getElementById('projects');

    const button5 = document.getElementById('learn-btn');
    const section5 = document.getElementById('about-me');

    button1.addEventListener('click', () => {
        window.scrollBy({top: section1.getBoundingClientRect().top, behavior: 'smooth'});
    });
    
    button2.addEventListener('click', () => {
        window.scrollBy({top: section2.getBoundingClientRect().top, behavior: 'smooth'});
    });
    
    button3.addEventListener('click', () => {
        window.scrollBy({top: section3.getBoundingClientRect().top, behavior: 'smooth'});
    });
    
    button4.addEventListener('click', () => {
        window.scrollBy({top: section4.getBoundingClientRect().top, behavior: 'smooth'});
    });

    button5.addEventListener('click', () => {
        window.scrollBy({top: section5.getBoundingClientRect().top, behavior: 'smooth'});
    });
    
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>