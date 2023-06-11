

											// 파일 선택 창 열기 및 자동 전환
											function selectFile() {
												document.getElementById(
														'fileinput').click();
											}

											// 파일이 선택되었을 때 자동으로 페이지 전환
											document
													.getElementById('fileinput')
													.addEventListener(
															'change',
															function() {
																document
																		.getElementById(
																				'edit_input')
																		.click();
															});

											// 파일 선택 창 열기 및 자동 전환
											function selectFile() {
												document.getElementById(
														'fileinput').click();
											}

											// 파일이 선택되었을 때 자동으로 페이지 전환
											document
													.getElementById('fileinput')
													.addEventListener(
															'change',
															function() {
																document
																		.getElementById(
																				'edit_input')
																		.click();
															});

											// 파일 선택 창 열기 및 자동 전환
											function selectFile() {
												document.getElementById(
														'fileinput').click();
											}

											// 파일이 선택되었을 때 자동으로 페이지 전환
											document
													.getElementById('fileinput')
													.addEventListener(

															'change',
															function() {
																document
																		.getElementById(
																				'edit_input')
																		.click();
															});

										function showRadioButton() {
											let feelings = [ '행복해', '우울해', '슬퍼' ];
											let radioButtons = document
													.querySelectorAll('.radiofeel');
											let feelState = document
													.getElementById('feel_state');
											feelState.textContent = ''; // feel_state의 내용을 초기화

											for (let i = 0; i < radioButtons.length; i++) {
												radioButtons[i].style.display = 'inline';
												radioButtons[i].nextSibling.textContent = feelings[i]; // 각 라디오 버튼의 텍스트 설정
											}

											document
													.getElementById('feel_edit_button').style.display = 'none';
										}

										function feeling(feeling, index) {
											let feelingText = document
													.createElement('span');
											feelingText.textContent = feeling;
											document.getElementById(
													'feel_state').appendChild(
													feelingText);

											let radioButtons = document
													.querySelectorAll('.radiofeel');
											for (let i = 0; i < radioButtons.length; i++) {
												radioButtons[i].style.display = 'none';
												radioButtons[i].nextSibling.textContent = ''; // 라디오 버튼의 텍스트 제거
											}

											document
													.getElementById('feel_edit_button').style.display = 'block';

											let feeling_img_url = [
													'background/smile.png',
													'background/gloomy.png',
													'background/sad.png' ];
											let feel_img = document
													.getElementById('feel_img');
											feel_img.src = feeling_img_url[index];
										}
						function showTextArea() {
											document
													.getElementById('myself_introduce').style.display = 'none';
											document.getElementById('textarea').style.display = 'block';
										}

										function saveText() {
											// 텍스트 저장 처리 및 다음 페이지로 이동
											// ...
											document.getElementById('textarea').style.display = 'none';
											document
													.getElementById('myself_introduce').style.display = 'block';
										}

										function cancelEdit() {
											document.getElementById('textarea').style.display = 'none';
											document
													.getElementById('myself_introduce').style.display = 'block';
										}
							

								function showTextArea1() {
									document
											.getElementById('user_mini_subject2').style.display = 'none';
									document.getElementById('subjectarea').style.display = 'block';
								}

								function saveText1() {
									// 텍스트 저장 처리 및 다음 페이지로 이동
									// ...
									document.getElementById('subjectarea').style.display = 'none';
									document
											.getElementById('user_mini_subject2').style.display = 'block';
								}

								function cancelEdit1() {
									document.getElementById('subjectarea').style.display = 'none';
									document
											.getElementById('user_mini_subject2').style.display = 'block';
								}
		
											


function showTextField() {
    document.getElementById('center_diary_contents1').style.display = 'none';
    document.getElementById('center_diary_contents2').style.display = 'block';
    document.getElementById('write_diary').style.display ='none';
}
    
    function     close_Textfield() {
        document.getElementById('center_diary_contents1').style.display = 'block';
        document.getElementById('center_diary_contents2').style.display = 'none';
        document.getElementById('write_diary').style.display ='block';
    }

		