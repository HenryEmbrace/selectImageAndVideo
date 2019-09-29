//
//  selectImageAndVideo.h
//  MyApp
//
//  Created by ZlHy on 2019/9/29.
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>
#import "TZImagePickerController.h"
#import "MediaUtils.h"
NS_ASSUME_NONNULL_BEGIN

@interface selectImageAndVideo : CDVPlugin

//存放选择好的图片
@property (nonatomic, strong) NSMutableArray *ImgsArr;
//插件调起连接
@property (strong, nonatomic) CDVInvokedUrlCommand* latestCommand;
//选择页面控制器
@property (nonatomic, strong) TZImagePickerController* imagePickerVc;



//选择图片
-(void)selectImage:(CDVInvokedUrlCommand *)command;
//选择视频
-(void)selectVideo:(CDVInvokedUrlCommand *)command;

-(void) imgsArr:(NSMutableArray * __nullable)imgsArr videoStr:(NSString *__nullable)videoStr;

@end

NS_ASSUME_NONNULL_END
