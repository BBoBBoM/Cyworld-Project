# Cyworld-Project
본인이 작업한 PC환경 및 사용한 IDE

시스템환경 os window10pro 64x
프로세서 intel(r) core(TM) i3-4130 cpu @ 3.40GHZ
RAM :16G

데이터베이스(DB) mysql 8.0.32.0 
using-language : java javascript html5/css3
using-IDE : ECLIPSE jee-2022-12 VSCode
using-JAVA Archive : cos.jar, jstl-1.2.jar, DB mysql-connector-java-8.0.30.jar
SERVER : Apache TOMCAT 9.0 version

DB 자료 export 파일로 만들어 놓았습니다 확인하거나 다른 목적으로 이용하실분들 import 해서 이용하세요
DB 연결하시면 아시겠지만 기본 Default 아이디 :3321 pwd : 213 입니다. 
회원가입기능도 동작은 하지만 Default 를 확신할수 없어요~~~

각 페이지 디자인은 balsamiq_wireframes으로 기본 구조를 잡고 작업을 시작했습니다.

login 기본화면은 다른 세부작업중이므로 로그인 기능 작동과 간단한 페이지 구성으로 아직 반응형 부분은 미흡합니다. 참고바랍니다.

기본 메인화면은 과거 Cyworld 와 비슷하게 꾸미려 했습니다 중간중간 같지 않은 부분도 많고 css style 본인의 구현 욕구에 따라 마음대로 작업하였습니다.

설정창에서 모든부분 EDIT 기능을 넣고 싶었으나 Index에 모두 넣은점 확인해주세요 


JSP로 DB의 데이터 저장 수정들이 가능하도록 해놓았고 구현해놓은 코드에 Default 값이 설정되어 있습니다.

회원가입시 Default 값을 미리 설정해야하나 설계부분에서 미흡한점이있어 작업중 끼워넣기 한 부분들이 코드가 뒤죽박죽 일수 있습니다. 이점 확인해서 코드 해석에 주의 부탁드려요 

방명록 게시판 설정 부분 미 구현 다른 index profile photo jukebox등도 세부적으로 뜯어보면 부족한 부분이 많습니다.

6개월 배운 총정리 같은 것이라 기록하고자 올립니다. 수정이 되면 같이 공유할 생각이고 같은 부분 프로젝트 하시는 분들에게도 도움이 되었으면합니다.

고쳐야 될 부분이나 피드백 가능하신분들 항상 환영합니다.

미흡하지만 봐주셔서 감사합니다!



6월 14일-- 각종 오류 수정 및 상품(배경)화면 구매에 관한 장바구니 추가 장바구니 삭제 관한 사항 진행중 진행사항 업로드 되어 있습니다.

        DB테이블 추가 및 일부 수정작업으로 DB table 자료 다시 export로 올려드립니다.
        index 벗꽃 휘날림 효과는 다른 분 것들 가져온 것이고 제가 한것은 아닙니다.
        
6월 15일 --backgound_purchase 관련 사항 물품 구매 
        DB연동해서 구매 물건들 추가 가능토록 진행함 (user가 보유하고 있는 효과에대해서는 재구매나 상품목록에서 빼는 방향으로 구상중)
        장바구니 물건 추가에 관한 사항은 추가한 물건이 없으면 페이지를 넘기지 않는 방향으로 설계 (원래는 없어도 화면이 보여지도록 해야하는데...)
        장바구니에 추가한 물건은 '삭제 할수 있으며 장바구니에 추가한 물건들의 총 합계를 구해 그 가격만큼 도토리가 차감되도록 구성 
        물건을 구매하면 session에 저장되이 있는 값들을 user_id 외 상품에 관한 부분  모두 삭제

        css 부분 아직 미흡 이후 간단하게라도 작업예정 
        
        DB 추가로 DB export 수정합니다 company가 통합으로 제공하는 상품 table 
        user_purchase 로 유저가 구매한 상품 저장하는 table 추가로 새로 업로드합니다 
        가지고 있는 효과 페이지로 적용하면 index 의 기본화면이 바뀌도록 작업중입니다. 완료되는대로 업로드 할게요~


6월 16일 -- 앞서 background와 outer 로 나누어져 있던 img파일을 하나의 이미지로 묶었습니다.
        보유하고 있는 having_effect.jsp 에서 적용 버튼을 누르면 DB user  background 란에 라디오버튼 선택 값이 update되도록 구현하고 
        index 외 구현한 페이지들 mini_background1 div 박스에 expression으로 DB에서 가져온 값을 넣어 background 효과가 변경되도록 구현하였습니다. 
        모든페이지 css파일 background효과 수정
        이외 외부 참고 코드 벚꽃 휘날림 구현한 페이지에 설정끝냈습니다.
        회원가입시 DB필드 갯수가 맞지않는 오류 수정 작업했습니다.

        금일 마지막으로 본인이 보유하고 있는 효과라면 배경화면 구매란에 본인이 보유하고 있는 부분은 제외한 상품을 제시하도록 수정하였습니다.

