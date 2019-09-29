//
//  selectImageAndVideo.m
//  MyApp
//
//  Created by ZlHy on 2019/9/29.
//

#import "selectImageAndVideo.h"

@interface selectImageAndVideo() <TZImagePickerControllerDelegate>

@end

@implementation selectImageAndVideo

-(NSMutableArray *)ImgsArr {
    if (!_ImgsArr) {
        _ImgsArr = [[NSMutableArray alloc] init];
    }
    return _ImgsArr;
}

#pragma 选择图片和视频的方法实现
//选择图片回调
-(void)selectImage:(CDVInvokedUrlCommand *)command {
    
    self.latestCommand = command;
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    
    
    //     设置是否显示图片序号
    imagePickerVc.showSelectedIndex = YES;
    //选择图片时不选视频
    imagePickerVc.allowPickingVideo =NO;
    
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
//        NSLog(@"PHOTOS:%@",photos);
        
        NSString *path = [NSString stringWithFormat:@"%@",[MediaUtils getTempPath]];
        
        NSString * PathString;
        
        NSDateFormatter *formater = [[NSDateFormatter alloc] init];//用时间给文件全名，以免重复
        [formater setDateFormat:@"yyyyMMddHHmmss"];
        
        for (int i = 0; i < photos.count; i++) {
            UIImage *img = [photos objectAtIndex:i];
            
            PathString = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@_%d.jpg",[formater stringFromDate:[NSDate date]],i]];
            [UIImageJPEGRepresentation(img,1) writeToFile:PathString atomically:YES];
            
            [self.ImgsArr addObject:PathString];
            
        }
        [self imgsArr:self.ImgsArr videoStr:nil];
        
    }];
    
    [self.viewController presentViewController:imagePickerVc animated:YES completion:nil];
    
}

//选择单张图片回调
-(void)selectSignleImage:(CDVInvokedUrlCommand *)command {
    
    self.latestCommand = command;
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    //选择图片时不选视频
    imagePickerVc.allowPickingVideo =NO;
    
    //     设置是否显示图片序号
    imagePickerVc.showSelectedIndex = YES;
    
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
        //        NSLog(@"PHOTOS:%@",photos);
        
        NSString *path = [NSString stringWithFormat:@"%@",[MediaUtils getTempPath]];
        
        NSString * PathString;
        
        NSDateFormatter *formater = [[NSDateFormatter alloc] init];//用时间给文件全名，以免重复
        [formater setDateFormat:@"yyyyMMddHHmmss"];
        
        for (int i = 0; i < photos.count; i++) {
            UIImage *img = [photos objectAtIndex:i];
            
            PathString = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@_%d.jpg",[formater stringFromDate:[NSDate date]],i]];
            [UIImageJPEGRepresentation(img,1) writeToFile:PathString atomically:YES];
            
            [self.ImgsArr addObject:PathString];
            
        }
        [self imgsArr:self.ImgsArr videoStr:nil];
        
    }];
    
    [self.viewController presentViewController:imagePickerVc animated:YES completion:nil];
    
}


//选择视频回调
-(void)selectVideo:(CDVInvokedUrlCommand *)command {
    self.latestCommand = command;
   
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:0 delegate:self];
    
     imagePickerVc.videoMaximumDuration = 10; // 视频最大拍摄时间
    
    [imagePickerVc setDidFinishPickingVideoHandle:^(UIImage *coverImage, PHAsset *asset) {
        [[TZImageManager manager] getVideoOutputPathWithAsset:asset success:^(NSString *outputPath) {
            NSLog(@"VIDEOPATH%@",outputPath);
            [self imgsArr:nil videoStr:[outputPath copy]];
            
        } failure:^(NSString *errorMessage, NSError *error) {
            NSLog(@"write failed");
        }];
        
    }];
    
     [self.viewController presentViewController:imagePickerVc animated:YES completion:nil];
}

//选择图片或者视频
-(void)selectIMageOrVideo:(CDVInvokedUrlCommand *)command {
    
    self.latestCommand = command;
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    
    
    //     设置是否显示图片序号
    imagePickerVc.showSelectedIndex = YES;
    imagePickerVc.videoMaximumDuration = 10; // 视频最大拍摄时间
    
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
        //        NSLog(@"PHOTOS:%@",photos);
        
        NSString *path = [NSString stringWithFormat:@"%@",[MediaUtils getTempPath]];
        
        NSString * PathString;
        
        NSDateFormatter *formater = [[NSDateFormatter alloc] init];//用时间给文件全名，以免重复
        [formater setDateFormat:@"yyyyMMddHHmmss"];
        
        for (int i = 0; i < photos.count; i++) {
            UIImage *img = [photos objectAtIndex:i];
            
            PathString = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@_%d.jpg",[formater stringFromDate:[NSDate date]],i]];
            [UIImageJPEGRepresentation(img,1) writeToFile:PathString atomically:YES];
            
            [self.ImgsArr addObject:PathString];
            
        }
        [self imgsArr:self.ImgsArr videoStr:nil];
        
    }];
    
    [imagePickerVc setDidFinishPickingVideoHandle:^(UIImage *coverImage, PHAsset *asset) {
        [[TZImageManager manager] getVideoOutputPathWithAsset:asset success:^(NSString *outputPath) {
            NSLog(@"VIDEOPATH%@",outputPath);
            [self imgsArr:nil videoStr:[outputPath copy]];
            
        } failure:^(NSString *errorMessage, NSError *error) {
            NSLog(@"write failed");
        }];
        
    }];
    
    [self.viewController presentViewController:imagePickerVc animated:YES completion:nil];
    
}





//上传图片数组/视频地址
-(void)imgsArr:(NSMutableArray *)imgsArr videoStr:(NSString *)videoStr {
    
    NSDictionary *upLoadDic;
    if (imgsArr.count > 0 && videoStr.length == 0) {
        upLoadDic = [NSDictionary dictionaryWithObjectsAndKeys:imgsArr,@"picture", nil];
    } else if (videoStr.length > 0 && imgsArr.count == 0 ) {
        
        upLoadDic = [NSDictionary dictionaryWithObjectsAndKeys:videoStr,@"video", nil];
    }
    
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:upLoadDic];
    [self.commandDelegate sendPluginResult:result callbackId:self.latestCommand.callbackId];
    
}


@end
