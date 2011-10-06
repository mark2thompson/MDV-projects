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
	//find the value of a selected radio button
	function getCheckBoxValue(){
		if($('favoriteDeal').checked){
			favoriteValue = $('favoriteDeal').value;
		}else{
			favoriteValue  = "No"
		}
	}
	function storeData(){
	getCheckBoxValue();
		var id					= Math.floor(Math.random()*100000001)
		var item 				= {};
			item.webDeals		= ["Type:", $('webDeals').value];
			item.dName			= ["Type:", $('dname').value];
			item.url			= ["Type:", $('url').value];
			item.rangeBar		= ["Type:", $('rangeBar').value];
			item.favoriteDeal	= ["Type:", favoriteValue];
			item.exDate			= ["Type:", $('exDate').value];
			item.notes			= ["Type:", $('notes').value];
		localStorage.setItem(id, JSON.stringify(item));		
		alert("Deal Saved");		
	}
	function getData(){
		var makeDiv = document.createElement('div');
		makeDiv.setAttribute("id", "items");
		var makeList = document.createElement('ul');
		makeDiv.appendChild(makeList);
		document.body.appendChild(makeDiv);
		for(var i=0, len=localStorage.length; i<len;i++){
			var makeLi = document.createElement('li');
			makeList.appendChild(makeLi);
			var key = localStorage.key(i);
			var value = localStorage.getItem(key);
			var obj = JSON.parse(value);
			var makeSubList = document.createElement('ul');
			makeLi.appendChild(makeSubList);
			for(var n in obj){
				var makeSubLi = document.createElement('li');
				makeSubList.appendChild(makeSubLi);
				var optSubText = obj[n][0]+" "+obj[n][1];
				makeSubLi.innerHTML = optSubText;		
			}
		}
	}
	
	//Variable defaults
/*	var addDealsList = ["--Choose type of Deal--", "Auto", "Grooming", "Entertainment"];	
	makeElements();*/
	
	//Set Link & Submit Click Events
	
	var displayLink = $("displayLink");
	displayLink.addEventListener("click", getData);
//	var clearLink = $("clear");
//	clearLink.addEventListenter("click", clearLocal);
	var save = $('submit');
	save.addEventListener("click", storeData);
	
});
