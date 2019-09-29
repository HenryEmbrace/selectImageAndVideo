# selectImageAndVideo
iOS版本 从相册选取图片和视频的ionic 插件

添加插件到项目中：
ionic cordova plugin add https://github.com/HenryEmbrace/selectImageAndVideo.git

对应的几个方法：
// 选择图片或者视频
-(void)selectIMageOrVideo:(CDVInvokedUrlCommand *)command;
//选择图片
-(void)selectImage:(CDVInvokedUrlCommand *)command;
//选择单张图片，一般用于上传头像
-(void)selectSignleImage:(CDVInvokedUrlCommand *)command;
//选择视频，目前视频只能单选
-(void)selectVideo:(CDVInvokedUrlCommand *)command;


在ionic中使用：
cordova.plugins.selectImageAndVideo.selectIMageOrVideo(args,(msg)=> {
     

        if (msg.video !== undefined) {
          if (this.platform.is('ios')) {
            videoArr.push(msg.video);
            this.hanldePhoto(videoArr);
          } else {
            videoArr = msg.video;
            this.hanldePhoto(videoArr);
          }
        } else if (msg.picture !== undefined) {
          this.hanldePhoto(msg.picture);
          console.log("图片上传为：" + msg.picture);
        }

        // this.hanldePhoto(imgBase, msg.picture);
      }, function (msg) {
      }, function (msg) {
        console.log("错误%o", msg);
      });
      
     // 上传方法为自己封装的，主要代码为： 
//     cordova.plugins.selectImageAndVideo.selectIMageOrVideo(args,(msg)=> {
//     cordova.plugins.selectImageAndVideo.selectImage(args,(msg)=> {
//     cordova.plugins.selectImageAndVideo.selectSignleImage(args,(msg)=> {
//     cordova.plugins.selectImageAndVideo.selectVideo(args,(msg)=> {

 
本插件基于 TZImagePickerController 图片选择器实现
感谢：TZImagePickerController 作者 谭真大佬
传送门： https://github.com/banchichen/TZImagePickerController

