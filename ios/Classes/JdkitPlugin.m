#import "JdkitPlugin.h"
#import "JDSDK/JDKeplerSDK.h"

@implementation JdkitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"jdkit"
            binaryMessenger:[registrar messenger]];
  JdkitPlugin* instance = [[JdkitPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"init" isEqualToString:call.method]) {
      NSDictionary *params=call.arguments;
      [[KeplerApiManager sharedKPService] asyncInitSdk:params[@"appKey"] secretKey:params[@"appSecretKey"] sucessCallback:^{
          NSLog(@"初始化成功");
          result(@{@"code":@0});
      } failedCallback:^(NSError *error) {
          NSLog(@"初始化失败");
          result(@{@"code":@0,@"msg":error.description});
      }];
  }else if ([@"openJDUrl" isEqualToString:call.method]) {
      NSDictionary *params=call.arguments;
      NSLog(@"openUrl：%@",params);
      NSString *url=params[@"url"];
      NSDictionary *userInfo=@{};
      if(params[@"userInfo"]){
          userInfo=params[@"userInfo"];
      }
      [[KeplerApiManager sharedKPService]openKeplerPageWithURL:url userInfo:userInfo successCallback:^{
          result(@{@"code":@0});
      } failedCallback:^(NSInteger code, NSString * _Nonnull url) {
          result(@{@"code":[NSNumber numberWithInt: code]});
      }];
  } else if ([@"openJXUrl" isEqualToString:call.method]) {
      NSDictionary *params=call.arguments;
      NSString *url=params[@"url"];
      NSDictionary *userInfo=@{};
      if(params[@"userInfo"]){
          userInfo=params[@"userInfo"];
      }
      [[KeplerApiManager sharedKPService]openJXPageWithUrl:url userInfo:userInfo success:^{
          result(@{@"code":@0});
      } failure:^(NSInteger code, NSString * _Nonnull url){
          result(@{@"code":[NSNumber numberWithInt: code]});
      }];
  }else {
    result(FlutterMethodNotImplemented);
  }
}

@end
