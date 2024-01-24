//
//  SecondViewController.swift
//  lesson 4 HW
//
//  Created by fortune cookie on 1/23/24.
//

import UIKit

class SecondViewController: UIViewController {
    private lazy var rightArrowButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowshape.right.fill"), for: .normal
        )
        button.addTarget(self, action: #selector(teleport), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        return button
    }()
    private lazy var bottomArrowButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowshape.down.fill"), for: .normal
        )
        button.addTarget(self, action: #selector(teleport), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        return button
    }()
    private lazy var loseLabel: UILabel = {
        let label = UILabel()
        label.text = "You Lose!"
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    private lazy var tryAgain: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(returntToStart), for: .touchUpInside)
        button.setTitle("Try Again", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setImage(UIImage(systemName: "arrow.circlepath"), for: .normal)
        return button
    }()
    private lazy var stepsLabel: UILabel = {
        let label = UILabel()
        label.text = "Steps left: \(total)"
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        view.backgroundColor = .white
        
        
     
        
       
        
    }
    func setupViewController(){
        view.addSubview(rightArrowButton)
        view.addSubview(bottomArrowButton)
        view.addSubview(loseLabel)
        view.addSubview(tryAgain)
        rightArrowButton.translatesAutoresizingMaskIntoConstraints = false
        bottomArrowButton.translatesAutoresizingMaskIntoConstraints = false
        loseLabel.translatesAutoresizingMaskIntoConstraints = false
        tryAgain.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rightArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 280),
            rightArrowButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            bottomArrowButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomArrowButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            loseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loseLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tryAgain.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tryAgain.topAnchor.constraint(equalTo: loseLabel.bottomAnchor, constant: 10)
            
        ])
        rightArrowButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        rightArrowButton.heightAnchor.constraint(equalToConstant: 250).isActive = true
        bottomArrowButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        bottomArrowButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        if total == 0{
            loseGAme()
        }else{
            stepsCount()
        }
    }

    func loseGAme(){
        print(total)
        tryAgain.isHidden = false
        loseLabel.text = "You Lose!"
        
        
    }
    
    func stepsCount(){
        loseLabel.text = "Steps left: \(total)"
        tryAgain.isHidden = true
        
    }
    
    @objc func teleport() -> Bool{
        let randomControllers = [ViewController(),SecondViewController(),ThirdViewController(),FourthViewController()]
        guard let random = randomControllers.randomElement() else { return false }
        navigationController?.pushViewController(random, animated: false)
        total -= 1
        return true
    }
    @objc func returntToStart(){
        let start = StartViewController()
        navigationController?.pushViewController(start, animated: false)
        
    }
    

   

}
