function formCheck(){
	
	var id = document.getElementById("id").value;
		if(id == "" || id.length == 0){
			alert("Please enter your ID");
			return false;
		}
		
		if(id.length < 3 || id.length > 11){
			alert("Please enter your ID in 3 to 10 letters");
			return false;
		}
		
	var pw = document.getElementById("password").value;
		if(pw == "" || pw.length == 0){
			alert("Please enter your Password");
			return false;
		}
		
		if(pw.length < 5 || pw.length > 11){
			alert("Please enter your Password in 5 to 10 letters");
			return false;
		}
	var name = document.getElementById("name").value;
		if(name == "" || name.length == 0){
			alert("Please enter your Name");
			return false;
		}
		return true;
	}

