//
//  ViewController.swift
//  project8
//
//  Created by Tamim Khan on 17/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    var cluesLable: UILabel!
    var ansLable: UILabel!
    var currentAns: UITextField!
    var scoreLable: UILabel!
    var letterButtons = [UIButton]()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        
        scoreLable = UILabel()
        scoreLable.translatesAutoresizingMaskIntoConstraints = false
        scoreLable.textAlignment = .right
        scoreLable.text = "SCORE: 0"
        view.addSubview(scoreLable)
        
        
        cluesLable = UILabel()
        cluesLable.translatesAutoresizingMaskIntoConstraints = false
        cluesLable.font = UIFont.systemFont(ofSize: 24)
        cluesLable.text = "ClUES"
        cluesLable.numberOfLines = 0
        cluesLable.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        view.addSubview(cluesLable)
        
        
        ansLable = UILabel()
        ansLable.translatesAutoresizingMaskIntoConstraints = false
        ansLable.font = UIFont.systemFont(ofSize: 24)
        ansLable.text = "ANSWER"
        ansLable.textAlignment = .right
        ansLable.numberOfLines = 0
        ansLable.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        view.addSubview(ansLable)
        
        
        currentAns = UITextField()
        currentAns.translatesAutoresizingMaskIntoConstraints = false
        currentAns.placeholder = "Tap letters to guess"
        currentAns.font = UIFont.systemFont(ofSize: 44)
        currentAns.textAlignment = .center
        currentAns.isUserInteractionEnabled = false
        view.addSubview(currentAns)
        
        
        let submit = UIButton(type: .system)
        submit.translatesAutoresizingMaskIntoConstraints = false
        submit.setTitle("SUBMIT", for: .normal)
        view.addSubview(submit)
        
        
        let clear = UIButton(type: .system)
        clear.translatesAutoresizingMaskIntoConstraints = false
        clear.setTitle("Clear", for: .normal)
        view.addSubview(clear)
        
        
        let buttonView = UIView()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonView)
        
        
        NSLayoutConstraint.activate([
            scoreLable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLable.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        
        
            cluesLable.topAnchor.constraint(equalTo: scoreLable.bottomAnchor),
            cluesLable.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
            cluesLable.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100),
            
            
            ansLable.topAnchor.constraint(equalTo: scoreLable.bottomAnchor),
            ansLable.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),
            ansLable.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
            ansLable.heightAnchor.constraint(equalTo: cluesLable.heightAnchor),
            
            
            currentAns.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAns.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            currentAns.topAnchor.constraint(equalTo: cluesLable.bottomAnchor, constant: 20),
            
            
            
            submit.topAnchor.constraint(equalTo: currentAns.bottomAnchor),
            submit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            submit.heightAnchor.constraint(equalToConstant: 44),
            
            
            clear.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            clear.centerYAnchor.constraint(equalTo: submit.centerYAnchor),
            clear.heightAnchor.constraint(equalToConstant: 44),
            
            
            buttonView.widthAnchor.constraint(equalToConstant: 750),
            buttonView.heightAnchor.constraint(equalToConstant: 320),
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonView.topAnchor.constraint(equalTo: submit.bottomAnchor, constant: 20),
            buttonView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
            
        
        ])
        
        let width = 150
        let height = 80
        
        
        for row in 0..<4{
            for col in 0..<5{
                let letterButton = UIButton(type: .system)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                letterButton.setTitle("www", for: .normal)
                
                
                let frame = CGRect(x: col * width, y: row * height, width: width, height: height)
                letterButton.frame = frame
                
               
                buttonView.addSubview(letterButton)
                letterButtons.append(letterButton)
                
                
            }
        }
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

