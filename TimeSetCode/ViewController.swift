//
//  ViewController.swift
//  TimeSetCode
//
//  Created by Nick on 6/12/17.
//  Copyright © 2017 NickOwn. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {


    @IBOutlet weak var tableview: UITableView!
    
    var postAr = [MsgObj]() //custom objects for received data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.tableview.rowHeight = UITableViewAutomaticDimension
        self.tableview.estimatedRowHeight = 280
        getData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func getData(){
        //assume get data from API with JSON format
        do{
            if let file = Bundle.main.url(forResource: "sample", withExtension: "json"){
                let data = try Data(contentsOf: file)
                let json = JSON(data: data)
                
                guard let dcAr = json["messages"].array else {
                    return
                }
                for dc in dcAr {
                    let userName = dc["username"].string ?? ""
                    let userThumb = dc["userThumb"].string ?? ""
                    let message = dc["message"].string ?? ""
                    let date = dc["date"].string ?? ""
                    var phtots = [String]()
                    if let photosAr = dc["photos"].array {
                        for li in photosAr {
                            let dic = li[].dictionary
                            phtots.append((dic?["image"]?.stringValue)!)
                        }
                    }
                    let likes = dc["likes"].int ?? 0
                    let comments = dc["comments"].int ?? 0
                
                    let tmpObj = MsgObj(Msg_username: userName, Msg_userThumb: userThumb, Msg_msg: message ,Msg_date: date, Msg_imgPath: phtots, likes, comments)
                    
                    self.postAr.append(tmpObj)
                
                }

                self.tableview.reloadData()
            }
        }catch{
            print("error")
        }
    
    }



}
extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postAr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as! CustomCell
        
        let postitem = postAr[indexPath.row]
        cell.lb_date.text = postitem.Msg_date
        cell.userName.text = postitem.Msg_username
        cell.userThumb.sd_setImage(with: URL(string: postitem.Msg_userThumb))
  
        //Here is how we deal with image
        if postitem.Msg_imgPath.count > 0 {
            let img1str = postitem.Msg_imgPath[0]
            let url1 = URL(string: img1str)
            
            cell.img1.sd_setImage(with: url1, completed: { retData in
                //resize UIimageview to fit image's ratio
                if let image = retData.0 {
                    let ratio = image.size.width / image.size.height
                    if ratio > 1 {
                        let newHeight = cell.frame.width / ratio
                        cell.img1.frame.size = CGSize(width: cell.frame.width, height: newHeight)
                    }else{
                        // if is height > width then we need to update this row
                        let newWidth = cell.frame.height * ratio
                        cell.img1.frame.size = CGSize(width: newWidth, height: cell.frame.height)
                        tableView.reloadRows(at: [indexPath], with: .automatic)
                    }
                    
                    
                }
                
            })
            
            
            
        }
        
        
        return cell
    }
    
    
    
}

