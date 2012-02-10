// Author Mark Thompson
// ASD 0212 project2
// Javascript data functions
//********************************************************************************
//Wait until the DOM is ready
$(document).ready(function(){	
//getElementById Function************************************************************
	function gtID(x){
		var theElement = document.getElementById(x);
		return theElement;
	}
//search***********************************************************************
/*var search = gtID('search');
search.addEventListener("click", getSearch);

	function getSearch(){
		var category = gtID('dealType').value;
		var term = gtID('search').value;
	
	
//search by catagory
if(category != "--Choose type of Deal--" && term === ""){
	for(i=0, j=localStorage.length; i<j; i++){
		var key = localStorage.key(i);
		var value = localStorage.getItem(key);
		var obj = JSON.parse(value);
		if(category === obj.group[1]){
			for (n in obj){
				alert(obj[n][1]);
			}
		}
	}
}

//search by term
if(term != "" && category === "--Choose type of Deal--"){
	for(i=0, j=localStorage.length; i<j; i++){
		var key = localStorage.key(i);
		var value = localStorage.getItem(key);
		var obj = JSON.parse(value);
		for (n in obj){
			if(term === obj[n][1]){
				for (q in obj){
					alert(obj[q][1]);
				}
			}	
		}
	}	
}
//search category and term
if (term != "" && category != "--Choose type of Deal--"){
	for(i=0, j=localStorage.length; i<j; i++){
		var key = localStorage.key(i);
		var value = localStorage.getItem(key);
		var obj = JSON.parse(value);
		for (n in obj){
			if (term === obj[n][1] && category === obj.group[1]){
				for (q in obj){
					alert(obj[q][1]);
				}
			}
		}
	}
}
}
*/
//find the value of a selected radio button***************************************
	function getCheckBoxValue(){
		if(gtID('favoriteDeal').checked){
			favoriteValue = "Yes";
		}else{
			favoriteValue  = "No";
		}
	}
//toggle display data or add deal**************************************************
	function toggleControls(n){
		switch(n){
			case "on":
				$('#couponForm').css('display','none');
				$('#clear').css('display' , 'inline');
				$('#displayLink').css('display' , 'none');
				$('#addNew').css('display' , 'inline');
				$('#submit').css('display' , 'none');
				break;
			case 'off':
				$('#couponForm').css('display' , 'block');
				$('#clear').css('display' , 'inline');
				$('#displayLink').css('display' , 'inline');
				$('#addNew').css('display' , 'none');
				$('#items').css('display' , 'none');
				$('#submit').css('display' , 'block');
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
			item.dealType		= ["Type:", $('#dealType').val()];
			item.dName			= ["Deal Name:", $('#dName').val()];
			item.url			= ["URL:", $('#url').val()];
			item.rangeBar		= ["Rating:", $('#rangeBar').val()];
			item.favoriteDeal	= ["Fav deal:", favoriteValue];
			item.exDate			= ["Exp Date:", $('#exDate').val()];
			item.notes			= ["Notes:", $('#notes').val()];
		localStorage.setItem(id, JSON.stringify(item));		
		alert("Deal Saved");
		window.location.reload(true);
	}
//********************************************************************************
	var getCSV = function(){
		$.ajax({
    		url      : "XHR/data.csv",
   		 	type     : "GET",
    		dataType : "html",
    		success  : function(csv) {
    		toggleControls("on");
    		var makeCSVDiv = $("<div></div>");
            		makeCSVDiv.attr({
            		"data-role":"page",
					"id": "CSVitems"
					});
			var col = csv.split("\n");	
			for (var i=1; i < col.length; i++ ){
				var cols = col[i];
				var text = cols.split(",");
				console.log(col[i]);
				var makeCSVList = $("<ul></ul>");
					makeCSVDiv.append(makeCSVList);
					$('body').append(makeCSVDiv);
					$('CSVitems').css("block");
						var makeLi = $('<li></li>');
						var linksLi = $('<li></li>');
						makeCSVList.append(makeLi);
						var obj = text
						var makeSubList = $("<ul></ul>");
						makeSubList.attr({"data-role" : "listview"});
						makeLi.append(makeSubList);
						var makeSubLi = $('<li>'+text[0]+'</li>'+
										  '<li>'+text[1]+'</li>'+
										  '<li>'+text[2]+'</li>'+
										  '<li>'+text[3]+'</li>'+
										  '<li>'+text[4]+'</li>'+
										  '<li>'+text[5]+'</li>'+
										  '<li>'+text[6]+'</li>');
						makeSubList.append(makeSubLi);
						makeSubList.append(linksLi);	
					
				
			}
    }
});
	}
	var getXML = function(){
		$.ajax({
    		url      : "XHR/XMLdata.xml",
    		type     : "GET",
    		dataType : "xml",
    		success  : function(xml){
    		toggleControls("on");
    		var makeXmlDiv = $("<div></div>");
            		makeXmlDiv.attr({
            		"data-role":"page",
					"id": "XMLitems"
					});
  			$(xml).find("item").each(function(){
                var xmlItem = {};
                    xmlItem.dealtype = ["Type:",$(this).find("dealType").text()];
                    xmlItem.dName = ["Deal Name:",$(this).find("dName").text()];
                    xmlItem.url = ["URL:",$(this).find("url").text()];
                    xmlItem.rangeBar = ["Rating:",$(this).find("rangeBar").text()];
                    xmlItem.favoriteDeal = ["Fav deal:",$(this).find("favoriteDeal").text()];
                    xmlItem.exDate = ["Exp Date:",$(this).find("exDate").text()];
                    xmlItem.notes = ["Notes:",$(this).find("notes").text()];					
            	var makeXmlList = $("<ul></ul>");
					makeXmlDiv.append(makeXmlList);
					$('body').append(makeXmlDiv);
					$('XMLitems').css("block");
						var makeLi = $('<li></li>');
						var linksLi = $('<li></li>');
						makeXmlList.append(makeLi);
						var obj = xmlItem
						var makeSubList = $("<ul></ul>");
						makeSubList.attr({"data-role" : "listview"});
						makeLi.append(makeSubList);
							for(var n in obj){
							var makeSubLi = $('<li></li>');
							makeSubList.append(makeSubLi);
						var optSubText = obj[n][0]+" "+obj[n][1];
						makeSubLi.html(optSubText);
						makeSubList.append(linksLi);	
					}
            })			
  			}
		});		
	}
	var getData = function(){
		toggleControls("on");
		if(localStorage.length === 0){
			autoFillData(defaultsJson);
		}
		
		var makeDiv = $("<div></div>");
		makeDiv.attr({
		"id": "items",
		"data-role":"page"});
		var makeList = $("<ul></ul>");
		makeDiv.append(makeList);
		$('body').append(makeDiv);
		$('items').css("block");
		for(var i=0, len=localStorage.length; i<len;i++){
			var makeLi = $('<li></li>');
			var linksLi = $('<li></li>');
			makeList.append(makeLi);
			var key = localStorage.key(i);
			var value = localStorage.getItem(key);
			var obj = jQuery.parseJSON(value);
			var makeSubList = $('<ul></ul>');
			makeSubList.attr({"data-role" : "listview"});
			makeLi.append(makeSubList);
			getImage(obj.dealType[1], makeSubList);
			for(var n in obj){
				var obj = jQuery.parseJSON(value);
				var makeSubLi = $('<li></li>');
				makeSubList.append(makeSubLi);
				var optSubText = obj[n][0]+" "+obj[n][1];
				makeSubLi.html(optSubText);	
				makeSubList.append(linksLi);
			}
			makeItemLinks(localStorage.key(i), linksLi); // creats edit and delete buttons for local storage. 
		}
	}
// get the images for the catagory
	var getImage = function(typeName, makeSubList){
		var imageLi = $('<li></li>');
		makeSubList.append(imageLi);
		var newImg = $('<img></img>');
		var setSrc = newImg.attr("src", "images/"+ typeName +".png");
		imageLi.append(newImg);
	}
//JSON OBJECT... auto populate local storage.*********************************************** 
	function autoFillData(json){
//store the json obj into local storage
		for(var n in json){
			var id = Math.floor(Math.random()*100000001);
			localStorage.setItem(id, JSON.stringify(json[n]));
		}
	}
//make item links******************************************************************
// creat the edit and delete links for each stored item
	function makeItemLinks(key, linksLi){
//add edit single item link
		var editLink = $('<a href = "#">Edit Deal</a>');
		editLink.key = key;
		$(editLink).click(editItem);
		linksLi.append(editLink);
		var breakTag =  $('<br>');
		linksLi.append(breakTag);
//add delete single item link	
		var deleteLink = $('<a href = "#">Delete Deal</a>');
		deleteLink.key = key;
		$(deleteLink).click(deleteItem);
		linksLi.append(deleteLink);
	}
//********************************************************************************
	function editItem(){
// Grab the data from local storage
		var value = localStorage.getItem(this.key);
		var item = jQuery.parseJSON(value);
//show the form
		toggleControls("off");
//populate form fields with local storage values******************************************************
		console.log(dealType[1]);
		gtID('dealType').value = item.dealType[1];
		gtID('dName').value = item.dName[1];
		gtID('url').value = item.url[1];
		gtID('rangeBar').value = item.rangeBar[1];
		gtID('exDate').value = item.exDate[1];
		gtID('notes').value = item.notes[1];
		if(item.favoriteDeal[1] === "Yes"){
			gtID('favoriteDeal').setAttribute("checked", "checked");
		}
//remove the initial listener from the input save contact button. *********************************************
		save.removeEventListener("click", storeData);
//change the submit button value to edit button
		gtID('submit').value = "Edit Deal";
		var editSubmit = gtID('submit');
//save the key value established in this function asa property of the editSubmit
//event so we can use that value when we save the data we editied .
		$(editSubmit).click(validate);
		editSubmit.key = this.key;
	}
//delete deal function********************************************************************
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
//clear deals**********************************************************************
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
//this is all part of the validate functions. **************************************************
	function validate(e){
//define the elements we want to check
		var getDealType = gtID('dealType');
		var getdName 	= gtID('dname');
		var getUrl		= gtID('url');	
//reset Error messages
		errMsg.html = "";
		$(getDealType).css("border","1px solid black");
		$(getdName).css("border","1px solid black");
		$(getUrl).css("border","1px solid black");
// get error messages
		var messageAry = [];
// type validation
		if(getDealType.value === "--Choose type of Deal--"){
			var typeError = "Please choose a deal type.";
			$(getDealType).css("border","1px solid red");
			messageAry.push(typeError);
		}
//deal name validation 
		if(getdName.value === ""){
			var dNameError = "Please enter a deal name.";
			$(getdName).css("border","1px solid red");
			messageAry.push(dNameError);
		}
//url validate
        var urlTest = getUrl.value.match(/^(ht|Ht)tps?:\/\/[a-z0-9-\.]+\.[a-z]{2,4}\/?([^\s<>\#%"\,\{\}\\|\\\^\[\]`]+)?$/);
			if(urlTest === null){	
			var urlError = "Please enter a URL.";
			$(getUrl).css("border","1px solid red");
			messageAry.push(urlError);
			alert ("Please enter a valid URL");		
		}
//if there are errors.... display them 
		if(messageAry.length >= 1){
			for(var i=0, j=messageAry.length; i < j; i++){
				var txt = $('<li></li>').html(messageAry[i]);
				errMsg.append(txt);
			}
			e.preventDefault();
		    return false;
		}else{
//if everything is fine save the data... send the key value
//remember the key value
			storeData(this.key);
		}	
	}
//Variable defaults	**************************************************************
	var errMsg = $('#errors');
//Set Link & Submit Click Events
	var csvButton = gtID("csvButton")
	$(csvButton).click(getCSV);
	var xmlButton = gtID("xmlButton")
	$(xmlButton).click(getXML);
	var jsonButton = gtID("jsonButton")
	$(jsonButton).click(getData);
	var displayLink = gtID("displayLink");
	$(displayLink).click(getData);
	var clearLink = gtID("clear");
	$(clearLink).click(clearLocal);
	var save = gtID('submit');
	$(save).click(validate);
//********************************************************************************
//closing
});