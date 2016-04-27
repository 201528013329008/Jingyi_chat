//
//  LoginViewController.swift
//  Jingyi
//
//  Created by 691 on 16/4/20.
//  Copyright © 2016年 691. All rights reserved.
//

import UIKit


//extension UIView {
//    @IBInspectable  var  cornerRadius: CGFloat{
//        get{
//        return layer.cornerRadius}
//        set {
//        layer.cornerRadius = newValue
//        layer.masksToBounds = (newValue>0)
//        }}
//}

class LoginViewController: UIViewController ,JSAnimatedImagesViewDataSource{

    
    @IBOutlet weak var loginStackView: UIStackView!
    
//    @IBOutlet weak var wallpaperImageView: JSAnimatedImagesView!
  
    @IBOutlet weak var wallpaperImageView: JSAnimatedImagesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.wallpaperImageView.dataSource = self
//         self.navigationController?.navigationBarHidden = true
  
        }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
   
    
    func animatedImagesNumberOfImages(animatedImagesView: JSAnimatedImagesView!) -> UInt {
        return 2
    }
    func animatedImagesView(animatedImagesView: JSAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {
        return UIImage(named: "image\(index+1)")
    }
  
    
    
   
   
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(2.5) {() ->Void in
        self.loginStackView.axis = UILayoutConstraintAxis.Vertical}
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
