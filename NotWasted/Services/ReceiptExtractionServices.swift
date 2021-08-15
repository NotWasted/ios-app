//
//  ReceiptExtractionServices.swift
//  NotWasted
//
//  Created by admin on 15/08/21.
//

import Foundation


class ReceiptExtractionServices {
  
    /**
     Sends Image to Vision Cloud API and returns text extracted from the Receipt Image
     */
    func getTextFromReceipt(data: Data, completionHandler: @escaping(_ result: ImageResponseModel) -> Void) {
        
    }
    
    /**
     Sends Receipt text to notwasted API service to get a list of items and update user pantry
     */
    func getItemsList() {
        
    }
    
    /**
        Sends a request to remove expired items from user pantry and save them to the recently expired list
     
     */
    func updateItemsList() {
        
    }
    
}
