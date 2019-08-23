//
//  MainViewController.m
//  MainProject
//
//  Created by Hem1ng on 2019/8/13.
//  Copyright © 2019 Hem1ngT4i. All rights reserved.
//

#import "MainViewController.h"
#import <ModuleBCategory/HTScheduler+ModuleB.h>
#import <ModuleACategory/HTScheduler+ModuleA.h>

/************************************************** 制作私有pod库步骤 **************************************************
 *1、新建任意文件夹
 *2、cd到新建文件，然后执行 pod spec create XXX（私有库名称，注意：这个名称就是后面pod导入时的名称），会生成XXX.podspec文件
 *3、打开XXX.podspec文件，改写里面的配置项如下：
 *  spec.name         = "XXX"                                       名称
 *  spec.version      = "0.0.1"                                     版本号
 *  spec.summary      = "summary"                                   概述
 *  spec.description  = <<-DESC
        description                                                 描述
    DESC
 *  spec.homepage     = "https://github.com/HemingTai/HTSpecs.git"  主页
 *  spec.license      = { type: 'MIT', file: 'LICENSE' }            证书
 *  spec.author       = { "Hem1ngTai" }                             作者
 *  spec.platform     = :ios, "10.0"                                平台和适用版本号
 *  spec.source       = { :git => "https://github.com/HemingTai/HTSpecs.git", :tag => spec.version }
 *                                                                  本地地址或远程仓库地址和版本号
 *  spec.source_files  = "ModuleB/Source/A.{h,m}"                  需要公开的资源文件路径，可用*代替A，*是通配符
 *4、修改完成后执行 pod lib lint 检验是否通过验证
 *5、通过验证后，既可上传代码至远程仓库，上传完成后需要先建tag
 *6、建完tag后，需要提交podspec至远程仓库，执行 pod repo push 远程仓库名 XXX.podspec
 *7、上传完成后，在需要导入私有库的pod文件中，加入 source "https://github.com/HemingTai/HTSpecs.git"
 *8、如果同时还需要导入第三方pod库，除了私有源，还需要加入官方源 source "https://github.com/CocoaPods/Specs.git"
 *9、制作本地库和远程库基本上一致，但是省去了上传步骤即上面的5、6、7、8，可直接在pod文件中导入本地库，如：pod 'ModuleB', :path => "~/Documents/ModuleProject/ModuleB"
 *10、远程pod库上传可能会导致spec_source_files报错The `source_files` pattern did not match any file建议修改路径为所有文件夹
 *11、如果私有库依赖了私有库，则需要在podspec文件添加spec.dependency "HTScheduler"，然后在验证时使用 pod lib lint --sources="https://github.com/HemingTai/HTSpecs.git"
 *12、将私有库上传至官方库，先cd到podspec文件z所在目录，然后执行注册命令：pod trunk register [EMAIL] [NAME],最后执行
 * pod trunk push XXX.podspec --allow-warnings
 ********************************************************************************************************************/
// 所有文件夹(ModuleB/**/*.{h,m})

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString: @"native://moduleA/viewController?a=10&b=20"];
    NSLog(@"%@",url.scheme);
    NSLog(@"%@",url.host);
    NSLog(@"%@",[url.path stringByReplacingOccurrencesOfString:@"/" withString:@""]);
    NSLog(@"%@",url.query);
    
    
    NSLog(@"int        : %s", @encode(int));
    NSLog(@"float      : %s", @encode(float));
    NSLog(@"float *    : %s", @encode(float*));
    NSLog(@"char       : %s", @encode(char));
    NSLog(@"char *     : %s", @encode(char *));
    NSLog(@"BOOL       : %s", @encode(BOOL));
    NSLog(@"void       : %s", @encode(void));
    NSLog(@"void *     : %s", @encode(void *));
    
    NSLog(@"NSObject * : %s", @encode(NSObject *));
    NSLog(@"NSObject   : %s", @encode(NSObject));
    NSLog(@"[NSObject] : %s", @encode(typeof([NSObject class])));
    NSLog(@"NSError ** : %s", @encode(typeof(NSError **)));
    
    int intArray[5] = {1, 2, 3, 4, 5};
    NSLog(@"int[]      : %s", @encode(typeof(intArray)));
    
    float floatArray[3] = {0.1f, 0.2f, 0.3f};
    NSLog(@"float[]    : %s", @encode(typeof(floatArray)));
    
    typedef struct _struct {
        short a;
        long long b;
        unsigned long long c;
    } Struct;
    NSLog(@"struct     : %s", @encode(typeof(Struct)));
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"---viewWillAppear---");
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"---viewWillLayoutSubviews---");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"---viewDidLayoutSubviews---");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"---viewDidAppear---");
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [[HTScheduler sharedScheduler] ModuleB_viewControllerWithCallback:^(NSString * _Nonnull result) {
        NSLog(@"ModuleB callback result is %@", result);
    }];
    
    [[HTScheduler sharedScheduler] ModuleA_viewControllerWithParam:@{@"name":@"Hem1ngT4i", @"age":@"20"}];
}


@end
