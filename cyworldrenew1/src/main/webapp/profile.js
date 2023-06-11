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



function showTextArea() {
	let fileContentDiv = document.getElementById("fileContent");
	let textarea = document.getElementById("filecontent_textarea");
	textarea.value = fileContentDiv.innerHTML.replace(/<br>/g, '\n');

	document.getElementById('profile_introduce_border1').style.display = 'none';
	document.getElementById('profile_introduce_border2').style.display = 'block';
}


function cancelEdit() {
	document.getElementById('profile_introduce_border2').style.display = 'none';
	document.getElementById('profile_introduce_border1').style.display = 'block';
	let fileContentDiv = document.getElementById("fileContent");
	let textarea = document.getElementById("filecontent_textarea");
	textarea.value = fileContentDiv.innerHTML.replace(/<br>/g, '\n');
}