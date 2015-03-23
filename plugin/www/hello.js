cordova.define("com.hatchinglab.cordova.gallery.hello", function(require, exports, module) { /*global cordova, module*/

module.exports = {
    show: function (name, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "Hello", "show", [name]);
    }
};

});
