//
//  UIViewController+UI.swift
//  Mooskine
//
//  Created by Guilherme on 3/10/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentWarningAlert(with message: String?) {
        let alert = UIAlertController(title: "Warning", message: "There was an error processing your request:\n\(message ?? "")", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
