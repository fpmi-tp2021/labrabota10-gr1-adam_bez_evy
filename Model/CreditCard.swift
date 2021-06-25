//
//  CreditCard.swift
//  MAnDAr_App
//
//  Created by arizngy on 17/06/2021.
import UIKit

class CreditCard: NSObject {
    var cardNumber: String?
    var cardOwner: String?
    var issueDate: String?
    var expireDate: String?
    
    init(cardNumber: String?,cardOwner: String?,issueDate: String?,expireDate: String?) {
        super.init()
        self.cardNumber = cardNumber
        self.cardOwner = cardOwner
        self.issueDate = issueDate
        self.expireDate = expireDate
    }
}
