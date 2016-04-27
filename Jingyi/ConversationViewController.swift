//
//  ConversationViewController.swift
//  Jingyi
//
//  Created by 691 on 16/4/17.
//  Copyright © 2016年 691. All rights reserved.
//

import UIKit

class ConversationViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        
        self.targetId = RCIMClient.sharedRCIMClient().currentUserInfo.userId
        self.userName = RCIMClient.sharedRCIMClient().currentUserInfo.name
        
        self.conversationType = RCConversationType.ConversationType_PRIVATE
        self.title = self.userName
        self.setMessageAvatarStyle(RCUserAvatarStyle.USER_AVATAR_CYCLE)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
