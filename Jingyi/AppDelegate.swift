//
//  AppDelegate.swift
//  Jingyi
//
//  Created by 691 on 16/4/17.
//  Copyright © 2016年 691. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,RCIMUserInfoDataSource {

    var window: UIWindow?
    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        
        
        
        let userInfo = RCUserInfo()
        userInfo.userId = userId
        switch userId{
        case "liujingyi":
            userInfo.name = "刘敬一"
            userInfo.portraitUri="https://liujingyi.s3-us-west-2.amazonaws.com/categories/images/000/000/005/medium/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7_2015-12-27_16.46.28.png?1453129169"
        case "xiaophai":
            userInfo.name = "二进制小p孩"
            userInfo.portraitUri="https://liujingyi.s3-us-west-2.amazonaws.com/categories/images/000/000/015/medium/f.jpeg?1453131095"
        default:
            print("wu")
        }
        return completion(userInfo)
    }

          //  没有名字的函数 闭包  不需要参数和返回值
    
    func connectserver(completion:()->Void ){
        //   查询保存的token
//
//        let tokenCache =
//        NSUserDefaults.standardUserDefaults().objectForKey("KDeviceToken")
//            as? String
//
        //  初始化appkey
        RCIM.sharedRCIM().initWithAppKey("ik1qhw0917qip")
        

        
        // 用token测试连接
    RCIM.sharedRCIM().connectWithToken("KGDYau7hkTHkYxqYLKa7Z3YItU4VSzzlCU4468ZYDKUST4bYLEUZ7+fZdgH1XRrjU1gXxRgvlDWHCc74ZqHCNA==", success:
            {(_)-> Void in
               
                let currentUser = RCUserInfo(userId:"liujingyi", name: "刘敬一", portrait:"https://liujingyi.s3-us-west-2.amazonaws.com/categories/images/000/000/005/medium/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7_2015-12-27_16.46.28.png?1453129169")
//                  let currentUser = RCUserInfo(userId:"xiaophai", name: "二进制小p孩", portrait:"https://liujingyi.s3-us-west-2.amazonaws.com/categories/images/000/000/015/medium/f.jpeg?1453131095")
              RCIMClient.sharedRCIMClient().currentUserInfo = currentUser
                print("连接成功1")
                
                
                dispatch_async(dispatch_get_main_queue(),{
                ()->Void in
              
                
                
                completion()
                })
            },
            error:{(_) ->Void in
                print("连接失败")})
            
            {() ->Void in
                print("token失效")
                
                
                
                
        }
    }
    
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //设置用户信息提供者为自己
        RCIM.sharedRCIM().userInfoDataSource = self
        
        // applicationId 即 App Id，clientKey 是 App Key。
//        获得leancloudshouquan

        AVOSCloud.setApplicationId("0tlEeMvgC7vpN20K6cqLRpgY-gzGzoHsz", clientKey: "1d9zaX1reqwsTcWhAcDO59mt")
        
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

