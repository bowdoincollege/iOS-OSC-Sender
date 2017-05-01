//
//  ViewController.swift
//  LikeOSC
//
//  Created by Stephen Houser on 4/13/17.
//  Copyright © 2017 stephenhouser. All rights reserved.
//

import UIKit
import OSCKit // https://github.com/256dpi/OSCKit
import AVFoundation

class ViewController: UIViewController {

    let ipAddressKey = "ip_address"
    let ipPortKey = "ip_port"

    let client = OSCClient()
    var clientIPAddress = "127.0.0.1"
    var clientIPPort = "2222"

    var clientAddress = "127.0.0.1:2222" //inet 139.140.214.218

    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateClientAddress()

        // Define identifier
        let notificationName = UserDefaults.didChangeNotification

        // Register to receive notification
        NotificationCenter.default.addObserver(self, selector:
            #selector(self.updateClientAddress),
            name: notificationName,
            object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateClientAddress() {
        print("Updated settings")
        
        let settings = UserDefaults.standard

        if settings.value(forKey: ipAddressKey) == nil {
            settings.set(clientIPAddress, forKey: ipAddressKey)
        }

        if settings.value(forKey: ipPortKey) == nil {
            settings.set(clientIPPort, forKey: ipPortKey)
        }

        if let ipAddressValue = settings.string(forKey: ipAddressKey),
            let ipPortValue = settings.string(forKey: ipPortKey) {
            clientAddress = "\(ipAddressValue):\(ipPortValue)"
        }
    }

    @IBAction func clickSoundButton(_ sender: UIButton) {
        if (audioPlayer != nil && audioPlayer.isPlaying) {
            audioPlayer.stop()
            audioPlayer = nil;
        } else {
            if let path = Bundle.main.path(forResource: "Narration", ofType: "mp3") {
               let url = URL(fileURLWithPath: path)

                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer.prepareToPlay()
                    audioPlayer.play()
                } catch {
                }
            }
        }
    }

    @IBAction func clickButton(_ sender: UIButton) {
        let tag = "/button-\(sender.tag)"
        let message = OSCMessage(address: tag, arguments: nil)
        client.send(message, to: "udp://\(clientAddress)")
    }
}

