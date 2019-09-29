var exec = require('cordova/exec');

exports.selectImage = function (arg0, success, error) {
    exec(success, error, 'selectImageAndVideo', 'selectImage', [arg0]);
};
exports.selectVideo = function (arg0, success, error) {
    exec(success, error, 'selectImageAndVideo', 'selectVideo', [arg0]);
};
exports.selectIMageOrVideo = function (arg0, success, error) {
    exec(success, error, 'selectImageAndVideo', 'selectIMageOrVideo', [arg0]);
};
exports.selectSignleImage = function (arg0, success, error) {
    exec(success, error, 'selectImageAndVideo', 'selectSignleImage', [arg0]);
};
