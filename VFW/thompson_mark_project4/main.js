// Author Mark Thompson
// VFW 1110 Project 4
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
				$('submit').style.display = "block";

				break;
			default:
				return false;
		}
	}
//********************************************************************************
//store the deal	
	function storeData(key){
		//if there is no key, this means this is a new item and needs a new key
		if (!key){
			var id = Math.floor(Math.random()*100000001);	
		}else{
			// set the id to the existing key so that it was save over the data
			// the key is the same key thats been passed along from the editSubmit even handler
			//to the validate function,. and then passed here, into the storeData function 
			id=key;
		}
	getCheckBoxValue();
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
			autoFillData();
			alert("There is no deals in Local Storage so default deals were added.");
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
//**************************THIS IS JUST FOR TESTING******************************
	//JSON OBJECT... auto populate local storage. 
	function autoFillData(){
		var json = {
			"deal1": {
				"dealType": ["Type:", "Web Auto"],
				"dName": ["Deal Name:", "Oil Change"],
				"url": ["URL:", "http://www.autozone.com"],
				"rangeBar": ["Rating:", "7"],
				"favoriteDeal": ["Fav deal:", "No"],
				"exDate": ["Exp Date:", "2012/10/09"],
				"notes": ["Notes:", "These are just some test notes."]			
			},
			"deal2": {
				"dealType": ["Type:", "Web Grooming"],
				"dName": ["Deal Name:", "Mach3 razors"],
				"url": ["URL:", "http://www.walmart.com"],
				"rangeBar": ["Rating:", "9"],
				"favoriteDeal": ["Fav deal:", "Yes"],
				"exDate": ["Exp Date:", "2012/10/15"],
				"notes": ["Notes:", "These are just some test notes."]			
			}	
		};
		//store the json obj into local storage
		for(var n in json){
			var id = Math.floor(Math.random()*100000001);
			localStorage.setItem(id, JSON.stringify(json[n]));
		}
	}
//**************************THIS IS JUST FOR TESTING******************************
//********************************************************************************
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
		deleteLink.addEventListener("click", deleteItem);
		deleteLink.innerHTML = deleteText;
		linksLi.appendChild(deleteLink);
	}
//********************************************************************************
	function editItem(){
		// Grab the data from local storage
		var value = localStorage.getItem(this.key);
		var item = JSON.parse(value);
		//show the form
		toggleControls("off");
//********************************************************************************
		//populate form fields with local storage values
		$('dealType').value = item.dealType[1];
		$('dname').value = item.dName[1];
		$('url').value = item.url[1];
		$('rangeBar').value = item.rangeBar[1];
		$('exDate').value = item.exDate[1];
		$('notes').value = item.notes[1];
		if(item.favoriteDeal[1] === "Yes"){
			$('favoriteDeal').setAttribute("checked", "checked");
		}
//********************************************************************************
		// remove the initial listener from the input save contact button. 
		save.removeEventListener("click", storeData);
		//change the submit button value to edit button
		$('submit').value = "Edit Deal";
		var editSubmit = $('submit');
		//save the key value established in this function asa property of the editSubmit
		//event so we can use that value when we save the data we editied .
		editSubmit.addEventListener("click", validate);
		editSubmit.key = this.key;
	}
//********************************************************************************	
	// delete deal function
	function deleteItem(){
		var ask = confirm("Are you sure you want to delete this deal?");
		if (ask){
			localStorage.removeItem(this.key);
			alert("Deal was deleted!!!")
			window.location.reload();
		}else{
			alert("Deal was not deleted.")	
		}
	}
//********************************************************************************
//clear deals	
	function clearLocal(){
		if(localStorage.length === 0){
			alert("There is no data to clear.");
		}else{
			localStorage.clear();
			alert("All Deals are deleted!");
			window.location.reload();
			return false;
		}
	}
//********************************************************************************
// this is all part of the validate functions. 
	function validate(e){
		//define the elements we want to check
		var getDealType = $('dealType');
		var getDname 	= $('dname');
		var getUrl		= $('url');
		
		//reset Error messages
		errMsg.innerHTML = "";
		getDealType.style.border	= "1px solid black";
		getDname.style.border 		= "1px solid black";
		getUrl.style.border 		= "1px solid black";
		
		// get error messages
		var messageAry = [];
		// type validation
		if(getDealType.value === "--Choose type of Deal--"){
			var typeError = "Please choose a deal type.";
			getDealType.style.border = "1px solid red";
			messageAry.push(typeError);
		}
		//deal name validation 
		if(getDname.value === ""){
			var dNameError = "Please enter a deal name.";
			getDname.style.border = "1px solid red";
			messageAry.push(dNameError);
		}
		//url validate
        var urlTest = getUrl.value.match(/^(ht|Ht)tps?:\/\/[a-z0-9-\.]+\.[a-z]{2,4}\/?([^\s<>\#%"\,\{\}\\|\\\^\[\]`]+)?$/);
		if(urlTest === null){
			var urlError = "Please enter a URL.";
			getUrl.style.border = "1px solid red";
			messageAry.push(urlError);
			alert ("URL should begin with" + '\n' + "http:// or https://");
		}	
		//if there are errors.... display them 
		if(messageAry.length >= 1){
			for(var i=0, j=messageAry.length; i < j; i++){
				var txt = document.createElement('li');
				txt.innerHTML = messageAry[i];
				errMsg.appendChild(txt);
			}
			e.preventDefault();
		    return false;
		}else{
			//if everything is fine save the data... send the key value
			//remember the key value
			storeData(this.key);
		}	
	}
//********************************************************************************
//Variable defaults	
	var errMsg = $('errors');
//Set Link & Submit Click Events
	
	var displayLink = $("displayLink");
	displayLink.addEventListener("click", getData);
	var clearLink = $("clear");
	clearLink.addEventListener("click", clearLocal);
	var save = $('submit');
	save.addEventListener("click", validate);
//********************************************************************************
//closing
});
