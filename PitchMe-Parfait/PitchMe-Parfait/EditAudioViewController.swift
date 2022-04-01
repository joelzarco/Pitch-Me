//
//  EditAudioViewController.swift
//  PitchMe-Parfait
//
//  Created by Johel Zarco on 01/04/22.
//

import UIKit

class EditAudioViewController: UIViewController {
    
    let spacingH : CGFloat = 60
    let vSpacing : CGFloat = 50
    let smallSpacing : CGFloat = 10
    
    let snailButton = UIButton()
    let chipmunkButton = UIButton()
    let rabbitButton = UIButton()
    let vaderButton = UIButton()
    let echoButton = UIButton()
    let reverbButton = UIButton()
    let stopButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        style()
        layout()
    }
    
    func style(){
        
        makeButton(button: snailButton, image: "Slow", withTag: 0)
        makeButton(button: chipmunkButton, image: "Fast", withTag: 1)
        makeButton(button: rabbitButton, image: "HighPitch", withTag: 2)
        makeButton(button: vaderButton, image: "LowPitch", withTag: 3)
        makeButton(button: echoButton, image: "Echo", withTag: 4)
        makeButton(button: reverbButton, image: "Reverb", withTag: 5)
        makeButton(button: stopButton, image: "Stop", withTag: 6)
    }
    
    func layout(){
        
        view.addSubview(snailButton)
        view.addSubview(chipmunkButton)
        view.addSubview(rabbitButton)
        view.addSubview(vaderButton)
        view.addSubview(echoButton)
        view.addSubview(reverbButton)
        view.addSubview(stopButton)
        
        // Constraints
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        // slowButton
        snailButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: spacingH).isActive = true
        snailButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: vSpacing).isActive = true
        // fastButton
        chipmunkButton.centerYAnchor.constraint(equalTo: snailButton.centerYAnchor).isActive = true
        chipmunkButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -spacingH).isActive = true
        // highPitch
        rabbitButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: spacingH).isActive = true
        rabbitButton.topAnchor.constraint(equalTo: snailButton.bottomAnchor, constant: vSpacing).isActive = true
        // vaderButton
        vaderButton.centerYAnchor.constraint(equalTo: rabbitButton.centerYAnchor).isActive = true
        vaderButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -spacingH).isActive = true
        // echoButton
        echoButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: spacingH).isActive = true
        echoButton.topAnchor.constraint(equalTo: rabbitButton.bottomAnchor, constant: vSpacing).isActive = true
        // reverbButton
        reverbButton.centerYAnchor.constraint(equalTo: echoButton.centerYAnchor).isActive = true
        reverbButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -spacingH).isActive = true
        // stopButton
        stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stopButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -smallSpacing).isActive = true
        // targets
        snailButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        chipmunkButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        rabbitButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        vaderButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        echoButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        reverbButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stopSound), for: .touchUpInside)
        
    }
    
    func makeButton(button : UIButton, image : String, withTag Tag : Int) {
        let image = UIImage(named: image) as UIImage?
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.tag = Tag
    }
    
    @objc func playSound(sender : UIButton){
        print("PlaySound tapped: \(sender.tag)")
    }
    
    @objc func stopSound(sender : UIButton){
        print("stopSound tapped")
    }
    
    @objc func dismissSelf(){
        print("dismissed!")
    }
}
