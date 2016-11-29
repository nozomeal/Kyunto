//
//  kyunTableViewController.swift
//  Kyun_1
//
//  Created by 坂本のぞみ on 2016/11/29.
//  Copyright © 2016年 坂本のぞみ. All rights reserved.
//

import UIKit

class kyunTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate //AppDelegateのインスタンスを取得
    
    @IBOutlet weak var memoTableView: UITableView!
    var kyunMemoArray:[String] = []
    //var parameters: [String : String] = [:] // 画面遷移後は ["hello": "こんにちは", "goodbye": "さようなら"]
    
    override func viewDidLoad() {
        /*kyunMemoArray = appDelegate.KyunMemo*/
    
        NSLog("@%:受け渡しおk",kyunMemoArray)
        super.viewDidLoad()
        
        memoTableView.delegate = self
        memoTableView.dataSource = self
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        //memoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // セルの個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kyunMemoArray.count
    }
    
    // セルの内容を変更
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = kyunMemoArray[indexPath.row]
        return cell
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("%@が選ばれましたんご",kyunMemoArray[indexPath.row])
    }*/
    
       
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

