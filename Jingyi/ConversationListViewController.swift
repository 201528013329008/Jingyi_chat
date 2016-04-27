//
//  ConversationListViewController.swift
//  Jingyi
//
//  Created by 691 on 16/4/18.
//  Copyright © 2016年 691. All rights reserved.
//

import UIKit

class ConversationListViewController:
RCConversationListViewController {
    
   
    @IBAction func ShowMenu(sender: UIBarButtonItem) {
        var frame = sender.valueForKey("view")?.frame
        frame?.origin.y = (frame?.origin.y)! + 30
        
        
//        
//        let menuItems =
//        [
//            KxMenuItem("与刘敬一聊天",image: UIImage(named: "tab_recent"),target: self,action: "ClickMenu1"),
//            KxMenuItem("与客服好友"       ,image: UIImage(named: "tab_groups"),target: self,action:"ClickMenu2"),
//        ]
//        KxMenu.showMenuInView(self.view, fromRect:frame! , menuItems: menuItems
//           
//        )
        
        
        let items = [
            MenuItem(title: "系统", iconName:"tab_people", glowColor: UIColor.redColor(),index: 0),
    MenuItem(title: "与应用聊天", iconName:"tab_people", glowColor: UIColor.yellowColor(),index: 1),
         MenuItem(title: "通讯录", iconName:"tab_people", glowColor: UIColor.grayColor(),index: 2),
            
            
             MenuItem(title: "关于", iconName:"tab_people", glowColor: UIColor.blueColor(),index: 3)
    ]
        
        let menu = PopMenu(frame:self.view.bounds,items:items)
//枚举类型可以省略PopMenuAnimationType
        menu.menuAnimationType = PopMenuAnimationType.NetEase
        if menu.isShowed {
        return }
        menu.didSelectedItemCompletion = {(selectedItem: MenuItem!) ->Void in
        
            print(selectedItem.index)
            switch selectedItem.index{
            case 1:
                let conVC = RCConversationViewController()
                conVC.targetId = "liujingyi"
                conVC.userName = "刘敬一"
                conVC.conversationType = RCConversationType.ConversationType_PRIVATE
                conVC.title = conVC.userName
                self.navigationController?.pushViewController(conVC, animated: true)
                self.tabBarController?.tabBar.hidden = true
                

            default:
                print(selectedItem.title
                )}
        }
        menu.showMenuAtView(self.view)
    }
  
    
    func ClickMenu1(){
        let conVC = RCConversationViewController()
        conVC.targetId = "liujingyi"
        conVC.userName = "刘敬一"
        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
        conVC.title = conVC.userName
        self.navigationController?.pushViewController(conVC, animated: true)
        self.tabBarController?.tabBar.hidden = true

    }
    func ClickMenu2(){
        print("您点击了第一项")}


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        appDelegate?.connectserver({ () -> Void in
            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_APPSERVICE.rawValue,
                RCConversationType.ConversationType_CHATROOM.rawValue,
                RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
                RCConversationType.ConversationType_DISCUSSION.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                RCConversationType.ConversationType_SYSTEM.rawValue])
            //        刷新会话列表、
            self.refreshConversationTableViewIfNeeded()
        })

       


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.tabBarController?.tabBar.hidden = true}
        
        
//       表格选中事件
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
//     转到会话页，用storyboard也可以
        let conVC = RCConversationViewController()
        conVC.targetId = model.targetId
        conVC.userName = model.conversationTitle
        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
        conVC.title = model.conversationTitle
        self.navigationController?.pushViewController(conVC, animated: true)
         self.tabBarController?.tabBar.hidden = true
    }
    

}
