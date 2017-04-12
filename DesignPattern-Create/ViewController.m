//
//  ViewController.m
//  DesignPattern-Create
//
//  Created by liangbai on 2017/2/28.
//  Copyright © 2017年 liangbai. All rights reserved.
//

// 数据类型
// char 1
// short 2
// int , unsigned int , float 4
// char *, long , unsigned long 4&8
// double , long long 8

#import "ViewController.h"
#import "SimpleFactory.h"
#import "Animals.h"

//DesignPattern Company
#import "CompanyFactory.h"
#import "ManagerFactory.h"
#import "FinanceFactory.h"
#import "DepartmentProduct.h"
#import "ManagerProduct.h"
#import "FinanceProduct.h"

#import <CoreMotion/CoreMotion.h>

#import "MethodBlocks.h"

#import "PrefixHeader.pch"
#import "ViewA.h"
#import "ViewA0.h"
#import "ViewA1.h"
#import "ViewB.h"
#import "ViewB1.h"

//测试 Foundation
#import "FYFoundation.h"

//测试GCD
#import "FYGCD.h"

#define VIEWALIGNPARENTTOPBOTTOM 130
#define VIEWALIGNPARENTLEFTRIGHT 40
#define HIGHTNAVIGATIONVIEWCONTROLLER 60

@interface ViewController ()

@property(nonatomic, strong) ViewA *viewA;
@property(nonatomic, strong) ViewA0 *viewA0;
@property(nonatomic, strong) ViewA1 *viewA1;

@property(nonatomic, strong) ViewB *viewB;
@property(nonatomic, strong) ViewB1 *viewB1;

@property(nonatomic, strong) UIView *viewC;

//定时器
@property(nonatomic, strong) dispatch_source_t dispatchSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
/*
    Animals *animal = [[SimpleFactory shareInstance] getConcreteAnimals:@"dog"];
    [animal sumOfLegs];
    [animal vocalise];
    [animal eat];
    
    [self testDesignPatternFactory];
    
    [self testMethodBlock];
*/
//    [self initHierarchy];
    
    [self initFoundation];
    
//    [self initView];
    [self initGCD];
}

#pragma mark - view

- (void)initView {
    BaseView *baseView = [[BaseView alloc] init];
    
}

#pragma mark - initHierarchy 初始化结构

- (void)initHierarchy {
    NSLog(@"UIScreen : width = %f, height = %f", UISCREEN_WIDTH, UISCREEN_HEIGHT);

    [self.view addSubview:self.viewA];
    [self.viewA addSubview:self.viewA0];
    [self.viewA0 addSubview:self.viewA1];
    
    [self.view addSubview:self.viewB];
    [self.viewB addSubview:self.viewB1];
}

#pragma mark - initGCD

- (void)initGCD {
    [[FYGCD shareInstance] timerOnDispatch];
}

#pragma mark - initFoundation

- (void)initFoundation {
    [[FYFoundation shareInstance] testNSArrayUsingFor];
}

- (UIView *)viewA {
    if (!_viewA) {
        _viewA = [[ViewA alloc] initWithFrame:CGRectMake(VIEWALIGNPARENTLEFTRIGHT, 20, UISCREEN_WIDTH - VIEWALIGNPARENTLEFTRIGHT *2, UISCREEN_HEIGHT - VIEWALIGNPARENTTOPBOTTOM * 2)];
        _viewA.tag = (0);
        _viewA.nameOfView = @"viewA";
        _viewA.labelTextColor = [UIColor blackColor];
        _viewA.backgroundColor = [UIColor yellowColor];
    }
    return _viewA;
}

- (UIView *)viewA0 {
    if (!_viewA0) {
        CGFloat alignParentTopBottom = VIEWALIGNPARENTTOPBOTTOM - 80;
        CGFloat alignParentLeftRight = VIEWALIGNPARENTLEFTRIGHT - 15;
        _viewA0 = [[ViewA0 alloc] initWithFrame:CGRectMake(alignParentLeftRight, alignParentTopBottom, _viewA.bounds.size.width -  alignParentLeftRight *2, _viewA.bounds.size.height - alignParentTopBottom *2)];
        _viewA0.tag = (1);
        _viewA0.nameOfView = @"viewA0";
        _viewA0.labelTextColor = [UIColor blackColor];
        _viewA0.backgroundColor = [UIColor orangeColor];
    }
    return _viewA0;
}

- (UIView *)viewA1 {
    if (!_viewA1) {
        CGFloat alignParentTopBottom = VIEWALIGNPARENTTOPBOTTOM - 70;
        CGFloat alignParentLeftRight = VIEWALIGNPARENTLEFTRIGHT - 15;
        _viewA1 = [[ViewA1 alloc] initWithFrame:CGRectMake(alignParentLeftRight, alignParentTopBottom, _viewA0.bounds.size.width - alignParentLeftRight *2, _viewA0.bounds.size.height - alignParentTopBottom *2)];
        _viewA1.tag = (2);
        _viewA1.nameOfView = @"viewA1";
        _viewA1.labelTextColor = [UIColor redColor];
        _viewA1.backgroundColor = [UIColor darkGrayColor];
    }
    return _viewA1;
}

- (UIView *)viewB {
    if (!_viewB) {
        _viewB = [[ViewB alloc] initWithFrame:CGRectMake(15, UISCREEN_HEIGHT - VIEWALIGNPARENTTOPBOTTOM * 2 + VIEWALIGNPARENTLEFTRIGHT, UISCREEN_WIDTH - 30, VIEWALIGNPARENTTOPBOTTOM * 2 - VIEWALIGNPARENTLEFTRIGHT * 2)];
        _viewB.tag = (0);
        _viewB.nameOfView = @"viewB";
        _viewB.labelTextColor = [UIColor blackColor];
        _viewB.backgroundColor = [UIColor blueColor];
    }
    return _viewB;
}

- (UIView *)viewB1 {
    if (!_viewB1) {
        _viewB1 = [[ViewB1 alloc] initWithFrame:CGRectMake(VIEWALIGNPARENTLEFTRIGHT, VIEWALIGNPARENTLEFTRIGHT - 10, _viewB.bounds.size.width - VIEWALIGNPARENTLEFTRIGHT * 2, _viewB.bounds.size.height - (VIEWALIGNPARENTLEFTRIGHT - 10) * 2)];
        _viewB1.tag = (0);
        _viewB1.nameOfView = @"viewB1";
        _viewB1.labelTextColor = [UIColor blackColor];
        _viewB1.backgroundColor = [UIColor redColor];
    }
    return _viewB1;
}

#pragma mark -designPattern 工厂模式验证

- (void)testDesignPatternFactory {
    
    CompanyFactory *companyFactory = [[ManagerFactory alloc] init];
    DepartmentProduct *departmentProduct = companyFactory.createDepartment;
    
    [departmentProduct functionDepartment];
    [departmentProduct nameDepartment];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)explorationApiInUIKitFramework {
//    UIAcceleration
//    UIAccelerometer         👁 使用替换
//    UIAccelerationValue
    
//    UIAccessibilityElement  👅 后面需要重新查看
    
//    UIBarItem
    
//      UINavigationController
//      UIBarButtonItem

//      UITabBarController
//      UITabBarItem
    
//    UIBezierPath
//    UIColor
//    UIDevice
//    UIDocumentInteractionController 👅 后面需要重新查看
    
//    UIEvent
//    UIFont
    
//    UIGestureRecognizer
//      UILongPressGestureRecognizer
//      UIRotationGestureRecognizer
//      UIPinchGestureRecognizer
//      UISwipeGestureRecognizer
//      UIPanGestureRecognizer
//      UITapGestureRecognizer
    
//    UIImage
    
//    UILocalizedIndexedCollation
//    UILocalNotification
    
//    UIMenuItem
//    UINavigationItem
//    UINib                          👅 后面需要重新查看
//    UIPasteboard                   👅 后面需要重新查看
//    UIPopoverController
    
//    UIPrintFormatter
//      UISimpleTextPrintFormatter
//      UIMarkupTextPrintFormatter
//      UIViewPrintFormatter
//    UIPrintInfo
//    UIPrintInteractionController
    
//    UIPrintPageRenderer
//    UIPrintPaper
    
//    UIScreen
//    UIScreenMode
    
//    UISearchDisplayController
//    UITextChecker
//    UITextInputStringTokenizer
//    UITextPosition
//    UITextRange
    
//    UITouch
    
    
    
//    🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️
    
//    UIResponder
//      UIApplication
//      UIView
//      UIViewController
    
//      UIView
//        UIControl
//        UIWebView
//        UISearchBar
//        UIScrollView
//        UIAlertView
//        UIActionSheet
//        UITableViewCell
//        UINavigationBar
//        UITabBar
//        UIToolbar
//        UIImageView
//        UIActivityIndicatorView
//        UIProgressView
//        UIPickerView
//        UILabel
//        UIWindow
    
    
    
//      UIViewController
//        UISplitViewController
//        UITabBarController
//        UITableViewController
//        UINavigationController
//        UIAlertController(代替 UIAlertView)
//        UISearchController(代替 UISearchDisplayController)

//        UINavigationController
//          UIImagePickerController
//          UIVideoEditorController


//    UIViewController *VC = [[UIViewController alloc] init];
//    [VC presentViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#> completion:<#^(void)completion#>]
//    [self dismissViewControllerAnimated: completion:];
    
//    UINavigationController *NV = [[UINavigationController alloc] init];
//    [NV pushViewController: animated:];
//    [NV dismissViewControllerAnimated: completion:];
    
//    🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️🤷🏼‍♂️

}


- (void)testMethodBlock {
    MethodBlocks *methodBlock = [[MethodBlocks alloc] init];
}

@end
