var exec = require('cordova/exec');

exports.selectImage = function (arg0, success, error) {
    exec(success, error, 'selectImageAndVideo', 'selectImage', [arg0]);
};
exports.selectVideo = function (arg0, success, error) {
    exec(success, error, 'selectImageAndVideo', 'selectVideo', [arg0]);
};
