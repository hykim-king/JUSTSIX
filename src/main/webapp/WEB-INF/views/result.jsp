<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>결과</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
  rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
  <link rel="stylesheet" type="text/css" href="/resources/css/main-sub.css" />
  <link rel="stylesheet" type="text/css" href="/resources/css/common.css"/>
  <script src="/resources/js/result.js"></script>
<title>서브페이지 리스트</title>
  
</head>
<body>


  <header class="header">
    <div class="header-con">
      <div class="logo">
        <a href="/"> <img src="/resources/img/intro/LOGO-gray.png"
          alt="logo">
        </a>
      </div>
      <div class="login">
        <img class="icon-login" alt="login"
          src="/resources/img/intro/icon-login.png">
        
      </div>
      
    </div>
  </header>

      
  <!-- 팝업 -->
  <div class="mypage_pop">
      <div class="close">
          <i class="fa fa-times-circle"></i>
      </div>
      <div class="mypage_name">
          <c:if test="${sessionScope.loginEmail != null}">
              <p class="my-email">${sessionScope.loginEmail}</p>
          </c:if>
      </div>
      <div class="underline"></div>
      <div class="mypage_btn">
          <c:if test="${sessionScope.loginEmail == null}">
              <div class="tag_button">
                  <p><a href="/member/login">로그인</a></p>
              </div>
          </c:if>
          <c:if test="${sessionScope.loginEmail != null}">
              <div class="tag_button">
                  <p><a href="/member/find">비밀번호변경</a></p>
              </div>
              <div class="tag_button">
                  <p><a href="/member/delete">회원탈퇴</a></p>
              </div>
              <div class="tag_button">
                  <p><a href="/member/logout">로그아웃</a></p>
              </div>
          </c:if>
      </div>
  </div>

  <div class="container">
    <h3
      style="text-align: center; padding: 100px 0 30px; font-weight: bold;">선택된
      키워드를 포함한 플레이 리스트</h3>

    <br>
    <table
      class="table table-bordered table-striped table-dark table-hover">
      <caption>FAQ List of Articles</caption>
      <thead class="thead-light text-center">
        <tr>
          <th style="width: 10%;"></th>
          <th style="width: 90%;">recommended list</th>

        </tr>
      </thead>
      <tbody class="text-center">
    <c:forEach var="music" items="${musicList}" varStatus="status">
        <tr>
          <td>

            <div class="album-img album01">
               <img src="/resources/img/sub/${music.albumpath}.jpg" alt="${music.title}">
            </div>
          </td>
          <td class="text-left">
            <div class="panel-faq-container">
              <div class="panel-faq-title">
                <div>${music.artist} - ${music.title}</div>
                
              
                
                <div><script>convertAndDisplayPlaytime(${music.playtime});</script></div>
                 
              </div>
              <div class="panel-faq-answer">
                <div class="youtube">
                  <iframe width="450px" height="250px"
                    src="https://www.youtube.com/embed/${music.link}"
                    title="YouTube video player" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    allowfullscreen></iframe>
                </div>
                <div class="lyric">
                  <p>${music.lyrics.replaceAll("#", "<br>")}</p>
                </div>
              </div>
            </div>
          </td>

        </tr>
        
  </c:forEach>
      </tbody>
        <tr class="list-sum">
          <td colspan=4 class="text-right">총 ${count}건의 데이터가 검색되었습니다.</td>

        </tr>
    </table>
    
    
    
  </div><!-- container end -->

  <footer class="footer">
    <p>Copyright ⓒ 2023 JustMusic. All rights reserved</p>
    <p>JustListen 사이트 내의 모든 서비스는 영리를 목적으로 하지 않습니다.</p> 
  </footer>
  

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/jquery-3.7.0.js"></script>  
<script >
// 헤더 / 서치팝업
$(".header .icon-login").click(function() {
    $(".mypage_pop").fadeToggle();
});
$(".mypage_pop .fa-times-circle").click(function() {
    $(".mypage_pop").fadeOut();
});
</script>

</body>
</html>
