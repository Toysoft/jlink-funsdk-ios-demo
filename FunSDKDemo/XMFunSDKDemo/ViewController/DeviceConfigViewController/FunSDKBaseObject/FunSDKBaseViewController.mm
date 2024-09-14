//
//  FunSDKBaseViewController.m
//   
//
//  Created by Tony Stark on 2021/6/17.
//  Copyright © 2021 xiongmaitech. All rights reserved.
//

#import "FunSDKBaseViewController.h"
#import <FunSDK/XTypes.h>
#import "ConfigModel.h"
#import "DeviceConfig.h"
#import "UIColor+Util.h"

@interface FunSDKBaseViewController ()

@end

@implementation FunSDKBaseViewController

-(instancetype)init{
    id obj = [super init];
    
    self.arrayCfgReqs = [[NSMutableArray alloc] initWithCapacity:8];
    self.channelNum = -1;
    
    return obj;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    UINavigationController *navigationController = self.navigationController;
    
    if (!navigationController) {
        return;
    }

    navigationController.navigationBar.backgroundColor = nil;
    navigationController.navigationBar.translucent = NO;
    navigationController.navigationBar.shadowImage = nil;
    navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];

    navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    navigationController.navigationBar.titleTextAttributes = @{
                                                               NSForegroundColorAttributeName:[UIColor blackColor]
                                                               
                                                               };
    

}

#pragma mark - 请求获取配置
-(void)requestGetConfig:(DeviceConfig*)config{
    int nSeq = [[ConfigModel sharedConfigModel] requestGetConfig:config];
    [self.arrayCfgReqs addObject:[[NSNumber alloc] initWithInt:nSeq]];
}

#pragma mark - 请求设置配置
-(void)requestSetConfig:(DeviceConfig*)config{
    int nSeq = [[ConfigModel sharedConfigModel] requestSetConfig:config];
    [self.arrayCfgReqs addObject:[[NSNumber alloc] initWithInt:nSeq]];
}


#pragma mark - 对象注销前调用
-(void)cleanContent{
    for ( NSNumber* num in self.arrayCfgReqs) {
        [[ConfigModel sharedConfigModel] cancelConfig:[num intValue]];
    }
}

- (void)dealloc{
    [self cleanContent];
}

-(void)OnFunSDKResult:(NSNumber *) pParam{
    NSInteger nAddr = [pParam integerValue];
    MsgContent *msg = (MsgContent *)nAddr;
    
    //需要处理特殊错误值 -70150 返回该错误时需要提示用户设置成功 需要重启生效
    if (msg->param1 == -70150 || msg->param1 == -11401) {
        msg->param1 = abs(msg->param1);
        
        [MessageUI ShowErrorInt:msg->param1];
    }
    
    //特殊处理 部分特殊设备登录和请求保存配置时，密码错误会回调-11318，而DSS预览时密码错误又会回调-11301，目前需要增加对-11318密码错误的适配.
    if (msg->param1 == -11318) {
        msg->param1 = -11301;
    }else if (msg->param1 == -70113){
        msg->param1 = -11302;
    }
    
    [self baseOnFunSDKResult:msg];
}

- (void)baseOnFunSDKResult:(MsgContent *)msg{
    
}

- (UIView *)tb_Container{
    if (!_tb_Container) {
        _tb_Container = [[UIView alloc] init];
        _tb_Container.backgroundColor = cTableViewFilletGroupedBackgroudColor;
    }
    
    return _tb_Container;
}

@end
