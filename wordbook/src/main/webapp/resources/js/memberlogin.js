function formCheck2() {
var id = document.getElementById("id").value;
	if(id == "" || id.length < 1) {
		alert("아이디를 입력해주세요.");
		
		return false;
	}
	
	var id = document.getElementById("id").value;
	if(id.length < 3 || id.length > 9) {
		alert("아이디는 3~8글자로 입력해주세요.");
		
		return false;
	}
	var password = document.getElementById("password").value;
	if(password == "" || password.length < 1) {
		alert("비밀번호를 입력해주세요.");
		
		return false;
	}
	var password = document.getElementById("password").value;
	if(password.length < 5 || password.length > 11) {
		alert("비밀번호는 5~10 글자로 입력해주세요.");
		
		return false;
	}
	return true;
}