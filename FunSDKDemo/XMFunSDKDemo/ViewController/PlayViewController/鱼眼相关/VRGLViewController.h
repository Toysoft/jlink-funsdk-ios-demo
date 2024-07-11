//
//  VRGLViewController.h
//  VRDemo
//
//  Created by J.J. on 16/8/26.
//  Copyright © 2016年 xm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import <FunSDK/VRSoft.h>
#include <queue>
using namespace std;

typedef struct SYUVData
{
    int width;
    int height;
    unsigned char *pData;
    SYUVData(int width, int height, unsigned char *pData)
    {
        this->width = width;
        this->height = height;
        int len = width * height * 3 / 2;
        if(len > 0){
            this->pData = new unsigned char[len];
            memcpy(this->pData, pData, len);
        } else {
            this->pData = NULL;
        }
    }
    ~SYUVData()
    {
        if(pData){
            delete []pData;
            pData = NULL;
        }
    }
} SYUVData;
typedef std::queue<SYUVData *> QUEUE_YUV_DATA;

@protocol VRGLViewControllerDelegate <NSObject>
- (void)vrglViewController: (CGPoint)point firstPoint:(CGPoint)firstPoint;
- (void)vrglViewControllerDoubleClicked:(CGPoint)point; //双击显示单画面
//MARK: 手势开始拖动
- (void)pointWithTouchesBegin:(CGPoint)point;
//MARK: 手势拖动中
- (void)pointWithTouchesMoved:(CGPoint)point;
- (void)pointWithTouchsCanceled:(CGPoint)point;
- (void)pointWithTouchesEnded:(CGPoint)point;

@end

@interface VRGLViewController : GLKViewController

@property (nonatomic,assign) int VRShowMode;
@property (nonatomic, assign) BOOL changeModel;         //是否切换吸顶模式和壁挂模式
@property (nonatomic,assign) int iCodecType;    //软硬解
@property (nonatomic,assign) int iSceneType;    //场景
@property (nonatomic,assign) int lensType;
@property (nonatomic,weak) id <VRGLViewControllerDelegate> vrglDelegate;
@property (nonatomic,assign) float lastVRScreenWidth;//最近一次初始化鱼眼窗口宽度
@property (nonatomic, strong) NSString *devID;
@property (nonatomic,assign) CGFloat hwRatio;//画面高宽比

//设置软解
-(void)configSoftEAGLContext;

-(void)setVRType:(XMVRType)type;

-(void)setVRShapeType:(XMVRShape)shapetype;

-(void)setVRVRCameraMount:(XMVRMount)Mount;
//鱼眼参数设置(半径宽高)
-(void)setVRFecParams:(int)xCenter yCenter:(int)yCenter radius:(int)radius Width:(int)imgWidth Height:(int)imgHeight;

-(void)PushData:(int)width height:(int)height YUVData:(unsigned char *)pData;

//智能分析报警之后界面旋转
-(void)setAnalyzeWithXL:(int)x0 YL:(int)y0 XR:(int)x1 YR:(int)y1 Width:(int)imgWidth Height:(int)imgHeight;

//滑动开始
-(void)SoftTouchMoveBegan:(NSSet *)SoftTouch Softevent:(UIEvent *)Softevent;
//滑动
-(void)SoftTouchMove:(NSSet *)SoftTouch Softevent:(UIEvent *)Softevent;
//滑动结束
-(void)SoftTouchMoveEnd:(NSSet *)SoftTouch Softevent:(UIEvent *)Softevent;

//捏合手势
-(void)SoftTouchesPinch:(CGFloat)scale;

-(void)reloadInitView:(CGRect)frame;

-(void)DoubleTap:(UITapGestureRecognizer*)recognizer;//双击手势
// 设置双目镜头显示方式
-(void)setTwoLensesDrawMode:(XMTwoLensesDrawMode)model;
// 设置双目镜头横向平铺方式时当前是左画面还是右画面(其他模式无效)
-(XMTwoLensesScreen)getVRSoftTwoLensesScreen;
// 设置双目镜头横向平铺方式时的左右镜头切换(其他模式无效)
-(void)setVRSoftTwoLensesScreen:(XMTwoLensesScreen)screenModel;

@end
