# Cordova Photo Gallery Plugin

This plugin is based on the hello world plugin. Example:

```
		var success = function(message) {
			//alert(message);
		}
		var failure = function() {
			alert("Error calling Gallery Plugin");
		}
		gallery.show(["Icon.png", 
				"http://www.helpinghomelesscats.com/images/cat1.jpg",
				"http://www.cats.org.uk/uploads/images/pages/photo_latest14.jpg",
				"http://www.nose2tail.co.uk/cat-matlock-derbyshire.jpg"
		], success, failure);
```

Checking isPhone() or isTablet():

```
		var success = function(message) {
			alert("is tablet: " + message);
		}
		var failure = function() {
			alert("Error calling Gallery Plugin");
		}
		gallery.isTablet(null, success, failure);
```
(Currently iOS is returning boolean while Android returns string. Need to fix this.)

---

# Cordova Hello World Plugin

Simple plugin that returns your string prefixed with hello.

Greeting a user with "Hello, world" is something that could be done in JavaScript. This plugin provides a simple example demonstrating how Cordova plugins work.

## Using
Clone the plugin

    $ git clone https://github.com/don/cordova-plugin-hello.git

Create a new Cordova Project

    $ cordova create hello com.example.helloapp Hello
    
Install the plugin

    $ cd hello
    $ cordova plugin install ../cordova-plugin-hello
    

Edit `www/js/index.js` and add the following code inside `onDeviceReady`

```js
    var success = function(message) {
        alert(message);
    }

    var failure = function() {
        alert("Error calling Hello Plugin");
    }

    hello.greet("World", success, failure);
```

Install iOS or Android platform

    cordova platform add ios
    cordova platform add android
    
Run the code

    cordova run 

## More Info

For more information on setting up Cordova see [the documentation](http://cordova.apache.org/docs/en/4.0.0/guide_cli_index.md.html#The%20Command-Line%20Interface)

For more info on plugins see the [Plugin Development Guide](http://cordova.apache.org/docs/en/4.0.0/guide_hybrid_plugins_index.md.html#Plugin%20Development%20Guide)
