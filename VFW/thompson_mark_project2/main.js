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
	
	//Create select field element and populate with options
	function makeElements(){
		var formTag = document.getElementsByTagName("form"),//formTag is an array
			selectLi = $("select"),
			makeSelect = document.createElement("select");
			makeSelect.setAttribute("id", "groups");
		for(var i=0, j=addDealsList.length; i<j; i++){
			var makeList = document.createElement("option");
			var optText = addDealsList[i];
			makeOption.setAttribute("value", optText);
			makeOption.innerHTML = optText;
			makeSelect.appendChild(makeList);
		}
		selectLi.appendChild(makeSelect)
	}
	
	//Variable defaults
	var addDealsList = ["--Choose type of Deal--", "Auto", "Grooming", "Entertainment"];	
	makeElements();
	
	//Set Link & Submit Click Events
	var displayLink = $("displayLink");
	displayLink.addEventListener("click", getData);
	var clearLink = $("clear");
	clearLink.addEventListenter("click", clearLocal);
	var save = $("Submit");
	save.addEventListener("click", storeData);
	
});