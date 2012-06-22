// If you want to prevent dragging, uncomment this section
/*
 function preventBehavior(e) 
 { 
 e.preventDefault(); 
 };
 document.addEventListener("touchmove", preventBehavior, false);
 */

/* If you are supporting your own protocol, the var invokeString will contain any arguments to the app launch.
 see http://iphonedevelopertips.com/cocoa/launching-your-own-application-via-a-custom-url-scheme.html
 for more details -jm */
/*
 function handleOpenURL(url)
 {
 // TODO: do something with the url passed in.
 }
 */

function onBodyLoad()
{		
    document.addEventListener("deviceready", onDeviceReady, false);
}

/* When this function is called, Cordova has been initialized and is ready to roll */
/* If you are supporting your own protocol, the var invokeString will contain any arguments to the app launch.
 see http://iphonedevelopertips.com/cocoa/launching-your-own-application-via-a-custom-url-scheme.html
 for more details -jm */
//geolocation
function display_alert(){
    alert("This is my alert!")
}
function onDeviceReady()
{
    pictureSource=navigator.camera.PictureSourceType,
    destinationType=navigator.camera.DestinationType
}

document.addEventListener("deviceready", onDeviceReady, false);
///////////      
function geoClick() {
    navigator.geolocation.getCurrentPosition(onSuccess, onError);
}
function onSuccess(position) {
    var element = document.getElementById('geolocation');
    element.innerHTML = 'Latitude: '           + position.coords.latitude              + '<br />' +
    'Longitude: '          + position.coords.longitude             + '<br />';
}
function onError(error) {
    alert('code: '    + error.code    + '\n' +
          'message: ' + error.message + '\n');
}
//camera
function onPhotoDataSuccess(imageData) {
    
    var smallImage = document.getElementById('smallImage');
    
    smallImage.style.display = 'block';
    
    smallImage.src = "data:image/jpeg;base64," + imageData;
}

function onPhotoURISuccess(imageURI) {
    var largeImage = document.getElementById('largeImage');
    largeImage.style.display = 'block';
    largeImage.src = imageURI;
}
function capturePhoto() {
    navigator.camera.getPicture(onPhotoDataSuccess, onFail, { quality: 50,
                                destinationType: destinationType.DATA_URL });
}

function capturePhotoEdit() {
    navigator.camera.getPicture(onPhotoDataSuccess, onFail, { quality: 20, allowEdit: true,
                                destinationType: destinationType.DATA_URL });
}
function getPhoto(source) {
    navigator.camera.getPicture(onPhotoURISuccess, onFail, { quality: 50, 
                                destinationType: destinationType.FILE_URI,
                                sourceType: source });
}
function onFail(message) {
    alert('Failed because: ' + message);
}
//heading
var watchID = null;

function startWatch() {
    // Update compass every 3 seconds
    var options = { frequency: 3000 };
    watchID = navigator.compass.watchHeading(onSuccess, onError, options);
}

function stopWatch() {
    if (watchID) {
        navigator.compass.clearWatch(watchID);
        watchID = null;
    }
}

// onSuccess: Get the current heading
//
function onSuccess(heading) {
    var element = document.getElementById('heading');
    element.innerHTML = 'Heading: ' + heading.magneticHeading;
}

// onError: Failed to get the heading
//
function onError(compassError) {
    alert('Compass error: ' + compassError.code);
}
