//
//  UIViewController+ErrorMessages.swift
//  Wayfindr Demo
//
//  Created by Wayfindr on 02/12/2015.
//  Copyright (c) 2016 Wayfindr (http://www.wayfindr.net)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights 
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
//  copies of the Software, and to permit persons to whom the Software is furnished
//  to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all 
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
//  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION 
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
//  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import UIKit


extension UIViewController {
    
    /**
     Convenience method to display error message to the user.
     
     - parameter title:   Title for alert.
     - parameter message: Message for alert.
     */
    func displayError(title title: String, message: String) {
        dispatch_async(dispatch_get_main_queue(), { [weak self] in
            let alertTitle = title.characters.count > 0 ? title : WAYStrings.CommonStrings.Error
            
            let alertController = UIAlertController(title: alertTitle, message: message, preferredStyle: .Alert)
            let doneButton = UIAlertAction(title: WAYStrings.CommonStrings.Done, style: .Default, handler: nil)
            alertController.addAction(doneButton)
            
            self?.presentViewController(alertController, animated: true, completion: nil)
        })
    }
    
}
