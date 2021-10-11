function formCheck() {
	var word = document.getElementById("word").value;
		if(word == "" || word.length < 1) {
			alert("Write down the word.");
			
		return false;
	}
	var word_kor = document.getElementById("word_kor").value;
		if(word_kor == "" || word_kor.length < 1) {
			alert("Write down the meaning of the word.");
			
		return false;
	}
	return true;
}