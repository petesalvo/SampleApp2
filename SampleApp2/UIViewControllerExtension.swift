//
//  UIViewControllerExtension.swift
//  SampleApp2
//
//  Created by Salvo, Pete on 10/17/15.
//  Copyright © 2015 Pete Salvo. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func getOverlayTag() -> Int { return 3114354 }
    
    func hideFullScreenModalActivityIndicator() {
        let overlay = self.view.viewWithTag(getOverlayTag())
        if overlay != nil {
            overlay!.removeFromSuperview()
        }
    }

    func showFullScreenModalActivityIndicator() -> UIView {
        let progressView = UIActivityIndicatorView()
        progressView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        progressView.autoresizingMask = [.FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleTopMargin, .FlexibleBottomMargin]
        
        var overlay = self.view.viewWithTag(getOverlayTag())
        if overlay == nil {
            overlay = UIView()
            overlay!.tag = getOverlayTag()
            overlay!.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
            overlay!.addSubview(progressView)
            self.view.addSubview(overlay!)
        }
        overlay!.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        progressView.startAnimating()
        return overlay!
    }
}