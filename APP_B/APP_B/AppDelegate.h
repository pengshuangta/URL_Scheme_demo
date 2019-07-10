//
//  AppDelegate.h
//  APP_B
//
//  Created by 彭双塔 on 2019/7/9.
//  Copyright © 2019 pst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/** url  */
@property (nonatomic,strong) NSString *url;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

