//
//  ScanReceiptViewModel.swift
//  NotWasted
//
//  Created by admin on 15/08/21.
//

import Foundation
import UIKit

class ScanReceiptViewModel: ObservableObject {
    
    var receiptImage: UIImage?
    
    @Published var uploadStatus: Int? = 0
    
    func uploadImage() {
        ReceiptExtractionServices().getTextFromReceipt(data: (self.receiptImage?.pngData())!, completionHandler: { (response) in
            if(response.imageText.isEmpty == false) {
                DispatchQueue.main.async {
                    // do some work
                    self.uploadStatus = 1
                }
            }
        })
    }
    
}
