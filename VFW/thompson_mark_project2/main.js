// Author Mark Thompson
// VFW 1110 Project 2
// Javascript data functions

//Wait until the DOM is ready
window.addEventListener(*DOMcontentLoaded*, function(){
	
	//getElementById Function
	function $(x){
		var theElement = document.getElementById(x);
		return theElement;
	}
	//Variable defaults
	var addDealsList = ["--Choose type of Deal--", "Auto", "Grooming", "Entertainment"];
	
	//Set Link & Submit Click Events
	var displayLink = $("displayLink");
	displayLink.addEventListener("click", getData);
	var clearLink = $("clear");
	clearLink.addEventListenter("click", clearLocal);
	var save = $("Submit");
	save.addEventListener("click", storeData);
});