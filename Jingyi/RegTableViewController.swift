//
//  RegTableViewController.swift
//  Jingyi
//
//  Created by 691 on 16/4/24.
//  Copyright © 2016年 691. All rights reserved.
//

import UIKit

class RegTableViewController: UITableViewController {
    
    var (userOK, passOK, mailOK) = (false,false,false)

@IBOutlet var loginTextFields: [UITextField]!
    
    
    
    @IBOutlet weak var user: UITextBox!
    @IBOutlet weak var pass: UITextBox!
    @IBOutlet weak var mail: UITextBox!
    @IBOutlet weak var region: UITextBox!
    @IBOutlet weak var question: UITextBox!
    @IBOutlet weak var answer: UITextBox!
    
//    检查必填
    
    func checkRequiredField(){
        
//        self.view.runBlockOnAllSuperviews { (subview ) -> Void in
//            if let subview = subview as? UITextField{
//                if subview.text!.isEmpty {
//                print("kong")}}
//        }
        for textField in loginTextFields {
            if textField.text!.isEmpty{
          self.errorNotice("必选项填满哦")
            }}
        let regex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicated = NSPredicate(format: "SELF MATCHES %@", regex )
        guard predicated.evaluateWithObject(mail.text) else {
        self.errorNotice("Emial 格式不对")
        return}
        
    }
    
//        for cell in tableView.visibleCells{
//            for subview in cell.subviews{
//                print(subview)
//                
//                
//                if let textField = subview as? UITextField{
//                    if textField.text!.isEmpty{
//                        
//                        let alert = UIAlertController(title: "必填", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
//                        let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default
//                            , handler: nil)
//                        alert.addAction(action)
//                        self.presentViewController(alert,animated:true,completion :nil)
//                    }}}}
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        self.title = "新用户注册"

        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done
            , target: self, action: "doneButtonTap")
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Undo, target: self, action: "doneButton")
////        实例化一个   默认按钮不可以点
        self.navigationItem.rightBarButtonItem?.enabled = false
        
        
        
        let doneButton = self.navigationItem.rightBarButtonItem
        
        
        let v1 = AJWValidator(type: .String)
        v1.addValidationToEnsureMinimumLength(3, invalidMessage: "用户名至少两位")
        v1.addValidationToEnsureMaximumLength(10, invalidMessage: "最长10位")
        self.user.ajw_attachValidator(v1)
        v1.validatorStateChangedHandler = {(newState: AJWValidatorState) ->Void in
            switch newState{
                
            case .ValidationStateValid :
                self.user.highlightState = .Default
                self.userOK = true
            default:
              
                let errorMsg = v1.errorMessages.first as? String
                self.user.highlightState = UITextBoxHighlightState.Wrong(errorMsg!)
                self.userOK = false
                
          
            }
             doneButton?.enabled = self.mailOK && self.passOK && self.userOK
        }
        let v2 = AJWValidator(type: .String)
        v2.addValidationToEnsureMinimumLength(3, invalidMessage: "密码至少4位")
        v2.addValidationToEnsureMaximumLength(15, invalidMessage: "最长15位")
        self.pass.ajw_attachValidator(v2)
        v2.validatorStateChangedHandler = {(newState: AJWValidatorState) ->Void in
            switch newState{
                
            case .ValidationStateValid :
                self.pass.highlightState = .Default
                  self.passOK = true
            default:
                
                let errorMsg = v2.errorMessages.first as? String
                self.pass.highlightState = UITextBoxHighlightState.Wrong(errorMsg!)
                 self.passOK = false
                
            }
             doneButton?.enabled = self.mailOK && self.passOK && self.userOK
        }
        let v3 = AJWValidator(type: .String)
      
        
        v3.addValidationToEnsureValidEmailWithInvalidMessage("邮箱格式不对")
        self.mail.ajw_attachValidator(v3)
        v3.validatorStateChangedHandler = {(newState: AJWValidatorState) ->Void in
            switch newState{
                
            case .ValidationStateValid :
                self.mail.highlightState = .Default
                  self.mailOK = true
            default:
                
                let errorMsg = v3.errorMessages.first as? String
                self.mail.highlightState = UITextBoxHighlightState.Wrong(errorMsg!)
                 self.mailOK = false
                
            }
             doneButton?.enabled = self.mailOK && self.passOK && self.userOK
        }}
//    输入的时候校验三个必填项  实时
//    注册新用户建立avobject
    func doneButtonTap() {
        
//        显示一个载入
        undoManager?.prepareWithInvocationTarget(self).makeKeyWindow()
        
        self.pleaseWait()
  let user = AVObject(className: "LUser")
//        把输入文本框的值输入到对象
        user["user"] = self.user.text
         user["pass"] = self.pass.text
         user["mail"] = self.mail.text
         user["region"] = self.region.text
     
         user["question"] = self.question.text
         user["answer"] = self .answer.text
//        查询是否已经注册
        let query = AVQuery(className: "LUser")
        query.whereKey("user", equalTo: self.user.text)
//        zhixingchaxun
        query.getFirstObjectInBackgroundWithBlock { (object , e) -> Void in
              self.clearAllNotice()
            if object != nil {
              
                self.errorNotice("该用户已经注册")
                self.user.becomeFirstResponder()
                
            }
            else{
//                self.successNotice("可注册")
user.saveInBackgroundWithBlock({ (succeed, error) -> Void in
    if succeed {
        self.successNotice("注册成功")
        self.navigationController?.popViewControllerAnimated(true)
    }
    else{
       print(error)
        
    }
})
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
