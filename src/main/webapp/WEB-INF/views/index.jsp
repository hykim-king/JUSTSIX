<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/fullpage.css" />
<title>Just Listen intro</title>
</head>
<body>

  <!-- fullPage.js container -->
  <div id="fullpage">
    <div class="section hidden" id="section1">
      <video class="intro_video" src="/resources/video/hand_tape.mp4" autoplay
        muted></video>
      <div class="intro_logo">
        <p>Just Listen</p>
      </div>
    </div>
    <div class="section desktopOnly" id="section2" data-disable="down">
      <div class="img01 sec02_img">
        <img src="/resources/img/intro/cap01.jpg" alt="capture01">
      </div>
      <div class="img02 sec02_img">
        <img src="/resources/img/intro/cap02.jpg" alt="capture01">
      </div>
      <div class="img03 sec02_img">
        <img src="/resources/img/intro/cap03.jpg" alt="capture01">
      </div>
    </div>
      <div class="desc sec02_desc">
        <p>
                          당신의 취향이 담긴 키워드 2~3가지를 골라 주세요!
        </p>
      </div>
    <div class="section" id="section3">
      <div class="img sec03_img">
        <img src="/resources/img/intro/intro-gif.gif" alt="capture01">
      </div>
      <div class="desc sec03_desc">
        <p>
                         당신의 취향에 쏙 맞는 노래를 찾아드립니다!
        </p>
      </div>
    </div>
    <div class="section" id="section4">
      <div class="sec04_btn_wrap">
      
        <div class="button intro-button intro-now">
          <a href="/music/recommend">바로시작하기</a>
        </div>
        <div class="button intro-button intro-login">
          <a href="/member/login">로그인 후 시작하기</a>
        </div>
      </div>
    </div>
  </div>


  <script type="text/javascript" src="/resources/js/fullpage.js"></script>

  <script>
    var myFullpage = new fullpage('#fullpage', {
      sectionsColor : [ '#fff', '#fff', '#fff', 'fff', '#fff' ],
      anchors : [ 'firstPage', 'secondPage', '3rdPage', '4thpage',
          'lastPage', 'more0', 'more1', 'more2', 'more3', 'more4' ],
      slidesNavigation : true,
      navigation : true,
      menu : '#menu',
      scrollBar : true
    });
  </script>

</body>
</html>