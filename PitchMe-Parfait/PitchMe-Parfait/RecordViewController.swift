//
//  ViewController.swift
//  PitchMe-Parfait
//
//  Created by Johel Zarco on 30/03/22.
//

import UIKit

class RecordViewController: UIViewController {
    
    let spacing : CGFloat = 20
    
    let recordButton = UIButton()
    let stopButton = UIButton()
    let recordLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    func style(){
        recordButton.translatesAutoresizingMaskIntoConstraints = false
        let recordImage = UIImage(named: "Record") as UIImage?
        recordButton.setImage(recordImage, for: .normal)
        
        recordLabel.translatesAutoresizingMaskIntoConstraints = false
        recordLabel.text = "Tap to record"
        recordLabel.textAlignment = .center
        recordLabel.font = UIFont.systemFont(ofSize: 16)
        recordLabel.textColor = .lightGray
        
        let stopImage = UIImage(named: "Stop") as UIImage?
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.setImage(stopImage, for: .normal)
        
        
        
    }
    
    func layout(){
        
        view.addSubview(recordButton)
        view.addSubview(recordLabel)
        view.addSubview(stopButton)
        
        recordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        recordButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        recordButton.addTarget(self, action: #selector(startRecording), for: .touchUpInside)
        recordButton.isEnabled = true
        
        recordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        recordLabel.topAnchor.constraint(equalTo: recordButton.bottomAnchor, constant: spacing).isActive = true

        stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stopButton.topAnchor.constraint(equalTo: recordLabel.bottomAnchor, constant: spacing).isActive = true
        stopButton.addTarget(self, action: #selector(stopRecording), for: .touchUpInside)
        stopButton.isEnabled = true

    }
    
    @objc func startRecording(sender : UIButton){
        print("RecordButton tapped!")
    }
    
    @objc func stopRecording(sender : UIButton){
        print("stopButton tapped!")
    }
    
}

