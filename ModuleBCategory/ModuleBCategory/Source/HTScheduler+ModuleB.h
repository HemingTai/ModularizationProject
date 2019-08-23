//
//  HTScheduler+ModuleB.h
//  ModuleBCategory
//
//  Created by Hem1ng on 2019/8/20.
//  Copyright © 2019 Hem1ngT4i. All rights reserved.
//

#import <HTScheduler/HTScheduler.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTScheduler (ModuleB)

- (UIViewController *)ModuleB_viewControllerWithCallback:(void(^)(NSString *result))callback;

@end

NS_ASSUME_NONNULL_END
