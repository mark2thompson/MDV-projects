function (doc) {
	if (doc._id.substr(0,4) === "deal"){
		emit(doc._id.substr(4), {
			"dName": doc.dName, 
			"dealType": doc.dealType, 
			"exDate": doc.exDate, 
			"favoriteDeal": doc.favoriteDeal,
			"notes": doc.notes,
			"rangeBar": doc.rangeBar, 
			"url": doc.url
		});
	}
};