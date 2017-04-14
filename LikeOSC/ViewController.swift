//
//  ViewController.swift
//  LikeOSC
//
//  Created by Stephen Houser on 4/13/17.
//  Copyright © 2017 stephenhouser. All rights reserved.
//

import UIKit
import OSCKit

class ViewController: UIViewController {

    let client = OSCClient()
    var clientAddress = "127.0.0.1:2222"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickLike(_ sender: UIButton) {
        let message = OSCMessage(address: "/like", arguments: nil)
        client.send(message, to: "udp://\(clientAddress)")
    }

    @IBAction func clickDontLike(_ sender: UIButton) {
        let message = OSCMessage(address: "/dontlike", arguments: nil)
        client.send(message, to: "udp://\(clientAddress)")
    }

    @IBAction func clickSoundToggle(_ sender: UIButton) {
        let message = OSCMessage(address: "/toggleSound", arguments: nil)
        client.send(message, to: "udp://\(clientAddress)")
    }

    @IBAction func clickSetup(_ sender: UIButton) {
        let alert = UIAlertController(title: "Max/MSP Address", message: "Address and Port", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = self.clientAddress
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            // Force unwrapping because we know it exists.
            let textField = alert!.textFields![0]
            if (textField.text != nil) {
                self.clientAddress = textField.text!
            }
            //print("Text field: \(textField.text)")
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)

    }

}

