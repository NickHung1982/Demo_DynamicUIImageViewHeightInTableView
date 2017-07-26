//
//  DataObjs.swift
//  TimeSetCode
//
//  Created by Nick on 6/12/17.
//  Copyright © 2017 NickOwn. All rights reserved.
//

import Foundation

class MsgObj: NSObject {
    var Msg_username: String //name
    var Msg_userThumb: String //
    var Msg_imgPath: [String] // image path array
    var Msg_date: String //ex: 2017.06.12
    var Msg_msg : String
    
    var Msg_like: Int = 0 //optional
    var Msg_comment: Int = 0
    
    init(Msg_username: String, Msg_userThumb: String,Msg_msg : String , Msg_date: String, Msg_imgPath: [String],_ Msg_like: Int = 0,_ Msg_comment: Int = 0 ) {
        self.Msg_username = Msg_username
        self.Msg_userThumb = Msg_userThumb
        self.Msg_date = Msg_date
        self.Msg_imgPath = Msg_imgPath
        self.Msg_msg = Msg_msg
    }
}
