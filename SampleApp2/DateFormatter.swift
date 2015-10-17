//
//  DateFormatter.swift
//  SampleApp2
//
//  Created by Salvo, Pete on 10/17/15.
//  Copyright © 2015 Pete Salvo. All rights reserved.
//

import Foundation

public class DateFormatter {
    
    public class func dateInMMddYYYYFormatFromString(string : String) -> String {
        let dateFormatter : NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "M/d/yyyy"
        
        if let dateAsDate = dateFormatter.dateFromString(string) {
            let stringToReturn = dateFormatter.stringFromDate(dateAsDate)
            return stringToReturn
        }
        
        return "N/A"
    }
}