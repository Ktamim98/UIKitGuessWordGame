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
    
    
    var activatedButtons = [UIButton]()
    var soluations = [String]()
    
    
    var score = 0 {
        didSet{
            DispatchQueue.main.async { [weak self] in
                self?.scoreLable.text = "Score: \(self?.score ?? 0)"
            }
        }
    }
    var level = 1
    
    
    
    var clueString = ""
    var soluationString = ""
    var letterBits = [String]()
    
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
        submit.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        view.addSubview(submit)
        
        
        let clear = UIButton(type: .system)
        clear.translatesAutoresizingMaskIntoConstraints = false
        clear.setTitle("Clear", for: .normal)
        clear.addTarget(self, action: #selector(clearTapped), for: .touchUpInside)
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
                letterButton.layer.borderWidth = 1
                letterButton.layer.borderColor = UIColor.lightGray.cgColor
                letterButton.setTitle("www", for: .normal)
                letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
                
                
                let frame = CGRect(x: col * width, y: row * height, width: width, height: height)
                letterButton.frame = frame
                
                
                buttonView.addSubview(letterButton)
                letterButtons.append(letterButton)
                
                
            }
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performSelector(inBackground: #selector(loadlevel), with: nil)
    }
    
    
    @objc func letterTapped(_ sender: UIButton){
        
        guard let buttonTitle = sender.titleLabel?.text else {return}
        
        currentAns.text = currentAns.text?.appending(buttonTitle)
        activatedButtons.append(sender)
        UIView.animate(withDuration: 1, delay: 0, animations: {
                sender.alpha = 0
            }) { finished in
                sender.isHidden = false
                //this should be true for hide the button when tapped but works pritty fine with false and i don't know why.
            }
        
        
    }
    @objc func submitTapped(_ sender: UIButton){
        
        guard let answareText = currentAns.text else {return}
        
        if let soluationPosition = soluations.firstIndex(of: answareText){
            activatedButtons.removeAll()
            
            var splitAnsware = ansLable.text?.components(separatedBy: "\n")
            splitAnsware?[soluationPosition] = answareText
            ansLable.text = splitAnsware?.joined(separator: "\n")
            
            currentAns.text = ""
            score += 1
            
        }
        else {
            let alert = UIAlertController(title: "Wrong Answer", message: "The answer is incorrect. Please try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
            currentAns.text = ""
            
            
            for btn in activatedButtons{
                UIView.animate(withDuration: 1, delay: 0, animations: {
                    btn.alpha = 1
                    }) { finished in
                       btn.isHidden = false
                    }
            }
        }
        
        if score % 7 == 0 {
            let ac = UIAlertController(title: "Well done!", message: "Let's go to another level", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: levelup))
            present(ac, animated: true)
        }
        
        
    }
        
        
        func levelup(action: UIAlertAction){
            level += 1
            soluations.removeAll(keepingCapacity: true)
            loadlevel()
            
            
            for btn in letterButtons{
                UIView.animate(withDuration: 1, delay: 0, animations: {
                    btn.alpha = 1
                    }) { finished in
                       btn.isHidden = false
                    }
            }
        }
        
        
        
        @objc func clearTapped(_ sender: UIButton){
            
            
            
            if var text = currentAns.text, !text.isEmpty {
                text.removeLast()
                currentAns.text = text
            }
            
            
            
            
            for btn in activatedButtons{
                UIView.animate(withDuration: 1, delay: 0, animations: {
                    btn.alpha = 1
                    }) { finished in
                       btn.isHidden = false
                    }
            }
            
            activatedButtons.removeAll()
            
            
        }
        
        @objc func loadlevel(action: UIAlertAction! = nil){
            performSelector(inBackground: #selector(parselevel), with: nil)
            performSelector(onMainThread: #selector(updateleveles), with: nil, waitUntilDone: false)
            
            score = 0
            letterButtons.shuffle()
            
            performSelector(onMainThread: #selector(setTitle), with: nil, waitUntilDone: false)
        }
        
        
        
        
        @objc func parselevel(){
            
            
            
            if let levelFileUrl = Bundle.main.url(forResource: "level\(level)", withExtension: "txt"){
                if let levelContents = try? String(contentsOf: levelFileUrl){
                    var lines = levelContents.components(separatedBy: "\n")
                    lines.shuffle()
                    
                    for (index, line) in lines.enumerated(){
                        let parts = line.components(separatedBy: ": ")
                        let answare = parts[0]
                        let clue = parts[1]
                        
                        clueString += "\(index + 1).\(clue)\n"
                        
                        
                        let soluationWord = answare.replacingOccurrences(of: "|", with: "")
                        soluationString += "\(soluationWord.count) letters\n"
                        soluations.append(soluationWord)
                        
                        
                        let bits = answare.components(separatedBy: "|")
                        letterBits += bits
                        
                    }
                }
            }
        }
        
        @objc func updateleveles(){
            
            cluesLable.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
            ansLable.text = soluationString.trimmingCharacters(in: .whitespacesAndNewlines)
            
        }
        
        @objc func setTitle(){
            if letterButtons.count == letterBits.count{
                for i in 0..<letterButtons.count{
                    letterButtons[i].setTitle(letterBits[i], for: .normal)
                }
            }
            
        }
        
    }
    
    

    
    
    
    
    
    


