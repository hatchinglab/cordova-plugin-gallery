/*global cordova, module*/

module.exports = {
    show: function (name, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "Gallery", "show", [name]);
    },
    isTablet: function (name, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "Gallery", "isTablet", [name]);
    },
    isPhone: function (name, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "Gallery", "isPhone", [name]);
    }
};
