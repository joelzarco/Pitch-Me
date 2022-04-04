//
//  ViewController.swift
//  PitchMe-Parfait
//
//  Created by Johel Zarco on 30/03/22.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController, AVAudioRecorderDelegate{
    
    let spacing : CGFloat = 20
    
    let titleLabel = UILabel()
    let recordButton = UIButton()
    let stopButton = UIButton()
    let recordLabel = UILabel()
    
    var audioRecorder : AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    func style(){
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = "PitchMe Parfait!"
        titleLabel.textColor = .lightGray
        
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
        
        view.addSubview(titleLabel)
        view.addSubview(recordButton)
        view.addSubview(recordLabel)
        view.addSubview(stopButton)
        
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2 * spacing).isActive = true
        
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
    
    // Audio Methods
    
    @objc func startRecording(){
        print("Record audio now!")
        setupUI(isPlaying: true)
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))

        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        // RecordViewController acts as delegate
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        print(filePath!)
    }
    @objc private func stopRecording(_ sender : UIButton!){
        print("Stop recording")
        setupUI(isPlaying: false)
        // stop audio recorder
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        // present EditView
        let editVC = EditAudioViewController()
        editVC.recordedAudioURL = audioRecorder.url
        editVC.title = "Edit audio"
        let navVC = UINavigationController(rootViewController: editVC)
        present(navVC, animated: true)
        navVC.modalPresentationStyle = .fullScreen
        
    }
    func setupUI(isPlaying : Bool){
        if (isPlaying){
            stopButton.isEnabled = true
            recordButton.isEnabled = false
            recordLabel.text = "Recording in progress"
        }else{
            stopButton.isEnabled = false
            recordButton.isEnabled = true
            recordLabel.text = "Record again"
        }
    }
    
    // from audio delegate
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Finished recording")
    }
}

