//
//  memoViewController.swift
//  Kyun_1
//
//  Created by 坂本のぞみ on 2016/11/27.
//  Copyright © 2016年 坂本のぞみ. All rights reserved.
//

import UIKit


import UIKit

class memoViewController: UIViewController,UITextFieldDelegate {
    
    var saveMemoData:UserDefaults=UserDefaults.standard
    //memo配列
    var KyunMemo: [String]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // インスタンス初期化
        let textField = UITextField()
        
        // サイズ設定
        textField.frame.size.width = self.view.frame.width * 2 / 3
        textField.frame.size.height = 60
        
        // 位置設定
        textField.center.x = self.view.center.x
        textField.center.y = 240
        
        // Delegate を設定
        textField.delegate = self
        
        // プレースホルダー
        textField.placeholder = "キャプションを入力"
        
        // 背景色
        textField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        // 左の余白
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
        // テキストを全消去するボタンを表示
        textField.clearButtonMode = .always
        
        // 改行ボタンの種類を変更
        textField.returnKeyType = .done
        
        // 画面に追加
        self.view.addSubview(textField)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 改行ボタンを押した時の処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // キーボードを隠す
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func saveMemo(){
        
        //UserDefalutsを書き込む（きゅんを保存）
        saveMemoData.set(KyunMemo,forKey: "kyunMemoKey")
        saveMemoData.synchronize()
        
        
        /*NSDictionary * memo = [[NSUserDefaults, standardUserDefaults], dictionaryRepresentation];
        NSLog("NSUserDefaults: %@", memo);*/
        
    //前回の保存内容があるかどうか判定
        if((saveMemoData.object(forKey: "kyunMemoKey")) != nil){
            //objectsを配列として確定させ、前回の保存内容を格納
            let objects=saveMemoData.object(forKey: "kyunMemoKey") as! NSArray
            //各名前を格納するための変数を宣言
            var _:AnyObject //memoString
            
            //前回の保存内容が格納された配列の中身を一つずつ取り出す
            for memoString in objects{
                //配列に追加していく
                KyunMemo.append(memoString as! String)
            }
        }
        //NSLog("@%:入力されました。",saveMemoData.object(forKey: "kyunMemoKey"))
    }
    
    
    
    //データの受け渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        var kyunTableViewController1 = segue.destination as! kyunTableViewController
        kyunTableViewController1.kyunMemoArray=saveMemoData.object(forKey: "kyunMemoKey") as! [String]
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
