// Author Mark Thompson
// VFW 1110 Project 2
// Javascript data functions

//Wait until the DOM is ready


window.addEventListener("DOMContentLoaded", function(){	
	
	//getElementById Function
	function $(x){
		var theElement = document.getElementById(x);
		return theElement;
	}
	
//Create select field element and populate with options
/*	function makeElements(){
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
	*/

	function storeData(){
		var id					= Math.floor(Math.random()*100000001)
		var item 				= {};
			item.webDeals		= ["Type:", $('webDeals').value];
			item.dName			= ["Type:", $('dname').value];
			item.url			= ["Type:", $('url').value];
			item.hotDeal		= ["Type:", $('hotDeal').value];
			item.rangeBar		= ["Type:", $('rangeBar').value];
			item.favoriteDeal	= ["Type:", $('favoriteDeal').value];
			item.exDate			= ["Type:", $('exDate').value];
			item.notes			= ["Type:", $('notes').value];
		localStorage.setItem(id, JSON.stringify(item));
		
		alert("Deal Stored");
	}
	
	//Variable defaults
/*	var addDealsList = ["--Choose type of Deal--", "Auto", "Grooming", "Entertainment"];	
	makeElements();
	
	//Set Link & Submit Click Events
	
var displayLink = $("displayLink");
	displayLink.addEventListener("click", getData);
	var clearLink = $("clear");
	clearLink.addEventListenter("click", clearLocal);*/
	var save = $('submit');
	save.addEventListener("click", storeData);
	
});
