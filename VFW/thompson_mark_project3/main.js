// Author Mark Thompson
// VFW 1110 Project 3
// Javascript data functions
//********************************************************************************
//Wait until the DOM is ready
window.addEventListener("DOMContentLoaded", function(){	
//********************************************************************************
//getElementById Function
	function $(x){
		var theElement = document.getElementById(x);
		return theElement;
	}
//********************************************************************************
//find the value of a selected radio button
	function getCheckBoxValue(){
		if($('favoriteDeal').checked){
			favoriteValue = "Yes";
		}else{
			favoriteValue  = "No";
		}
	}
//********************************************************************************
//toggle display data or add deal
	function toggleControls(n){
		switch(n){
			case "on":
				$('couponForm').style.display = "none";
				$('clear').style.display = "inline";
				$('displayLink').style.display = "none";
				$('addNew').style.display = "inline";
				$('submit').style.display = "none";
				break;
			case "off":
				$('couponForm').style.display = "block";
				$('clear').style.display = "inline";
				$('displayLink').style.display = "inline";
				$('addNew').style.display = "none";
				$('items').style.display = "none";
				break;
			default:
				return false;
		}
	}
//********************************************************************************
//store the deal	
	function storeData(){
	getCheckBoxValue();
		var id					= Math.floor(Math.random()*100000001)
		var item 				= {};
			item.dealType		= ["Type:", $('dealType').value];
			item.dName			= ["Deal Name:", $('dname').value];
			item.url			= ["URL:", $('url').value];
			item.rangeBar		= ["Rating:", $('rangeBar').value];
			item.favoriteDeal	= ["Fav deal:", favoriteValue];
			item.exDate			= ["Exp Date:", $('exDate').value];
			item.notes			= ["Notes:", $('notes').value];
		localStorage.setItem(id, JSON.stringify(item));		
		alert("Deal Saved");		
	}
//********************************************************************************
//get the data
	function getData(){
		toggleControls("on");
		if(localStorage.length === 0){
			alert("There is no deals to clear!");
		}
		var makeDiv = document.createElement('div');
		makeDiv.setAttribute("id", "items");
		var makeList = document.createElement('ul');
		makeDiv.appendChild(makeList);
		document.body.appendChild(makeDiv);
		$('items').style.display = "block";
		for(var i=0, len=localStorage.length; i<len;i++){
			var makeLi = document.createElement('li');
			var linksLi = document.createElement('li');
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
				makeSubList.appendChild(linksLi);
			}
			makeItemLinks(localStorage.key(i), linksLi); // creats edit and delete buttons for local storage. 
		}
	}
	// make item links
	// creat the edit and delete links for each stored item
	function makeItemLinks(key, linksLi){
		//add edit single item link
		var editLink =  document.createElement('a');
		editLink.href = "#";
		editLink.key = key;
		var editText = "Edit Deal";
		editLink.addEventListener("click", editItem);
		editLink.innerHTML = editText;
		linksLi.appendChild(editLink);
		
		//add line break
		var breakTag =  document.createElement('br');
		linksLi.appendChild(breakTag);
		
		//add delete single item link	
		var deleteLink = document.createElement('a');
		deleteLink.href = "#";
		deleteLink.key = key;
		var deleteText = "Delete Deal";
		//deleteLink.addEventListener("click", deleteItem);
		deleteLink.innerHTML = deleteText;
		linksLi.appendChild(deleteLink);
	}
	
	function editItem(){
		// Grab the data from local storage
		var value = localStorage.getItem(this.key);
		var item = JSON.parse(value);
		//show the form
		toggleControls("off");
		
		//populate form fields with local storage values
		$('dealType').value = item.dealType[1];
		$('dName').value = item.dName[1];
		$('url').value = item.url[1];
		$('rangeBar').value = item.rangeBar[1];
		$('exDate').value = item.exDate[1];
		$('notes').value = item.notes[1];
		if(obj.favoriteDeal[1] === "Yes"){
			$('favoriteDeal').setAttribute("checked", "checked");
		}
		 

	}
//********************************************************************************
//clear deals	
	function clearLocal(){
		if(localStorage.length === 0){
			alert("There is no data to clear.")
		}else{
			localStorage.clear();
			alert("All Deals are deleted!");
			window.location.reload();
			return false;
		}
	}
//********************************************************************************
		
//********************************************************************************

//Variable defaults	
//Set Link & Submit Click Events
	var displayLink = $("displayLink");
	displayLink.addEventListener("click", getData);
	var clearLink = $("clear");
	clearLink.addEventListener("click", clearLocal);
	var save = $('submit');
	save.addEventListener("click", storeData);
//********************************************************************************
//closing
});
