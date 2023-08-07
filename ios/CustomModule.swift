import Foundation
import UIKit
import React

@objc(CustomModule)
class CustomModule: NSObject, RCTBridgeModule {
    static func moduleName() -> String {
        return "CustomModule"
    }

    @objc func showAlert(_ message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            
            UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true)
        }
    }

    @objc func showBlueView(_ callback: @escaping RCTResponseSenderBlock) {
        DispatchQueue.main.async {
            let blueViewController = BlueViewController()

            // Get the current root view controller to present the blue view controller
            if let rootViewController = UIApplication.shared.delegate?.window??.rootViewController {
                rootViewController.present(blueViewController, animated: true) {
                    // Call the callback with success once the modal presentation is completed
                    callback([NSNull(), true]) // Success callback
                }
            } else {
                // Call the callback with an error message if modal presentation fails
                callback(["Error presenting blue view.", NSNull()]) // Error callback
            }
        }
    }

    // Export methods to JavaScript
    @objc
    static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
