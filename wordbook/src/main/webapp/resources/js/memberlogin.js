function formCheck_3() {
	var id = document.getElementById("id").value;
		if(id == "" || id.length == 0) {
			alert("Please enter your ID.");
			
			return false;
		}
		var id = document.getElementById("id").value;
		if(id.length < 3 || id.length > 9) {
			alert("Please enter your ID in 3 to 8 letters.");
			
			return false;
		}
		var password = document.getElementById("password").value;
		if(password == "" || password.length == 0) {
			alert("Please enter your password.");
			
			return false;
		}
		var password = document.getElementById("password").value;
		if(password.length < 5 || password.length > 11) {
			alert("Please enter your password in 5 to 10 letters.");
			
			return false;
		}
		return true;
	}