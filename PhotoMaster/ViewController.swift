//
//  ViewController.swift
//  PhotoMaster
//
//  Created by 岩本果純 on 2016/05/30.
//  Copyright © 2016年 KasumiIwamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //カメラ、アルバムの呼び出しメソッド
    func precentPickerController(sourceType:UIImagePickerControllerSourceType){
    //カメラを使用できるか
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.presentViewController(picker,animated:true,completion:nil)
        }
    }
    //func imagePickerController(picker:UIImagePickerController!,didFinishPickerImage image:UIImage!,editingInfo:NSDictionary!){
       // self.dismissViewControllerAnimated(true,completion:nil)
        
        //画像出力
       // photoImageView.image = image
       // print(image)
    //}
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
         self.dismissViewControllerAnimated(true,completion:nil)
        photoImageView.image = image
        print(image)
    }
    @IBAction func selectButtonTapped(sender:UIButton){
        let alertController = UIAlertController(title:"画像の取得先を選択",message:nil,preferredStyle:.ActionSheet)
        let firstAction = UIAlertAction(title:"カメラ",style:.Default){
            action in
            self.precentPickerController(.Camera)
        }
        let secondAction = UIAlertAction(title:"アルバム",style:.Default){
            action in
            self.precentPickerController(.PhotoLibrary)
        }
        let cancelAction = UIAlertAction(title:"キャンセル",style:.Cancel,handler:nil)
        
        //設定した選択肢をアラートに登録
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        alertController.addAction(cancelAction)
        //アラート表示
        presentViewController(alertController,animated:true,completion:nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

