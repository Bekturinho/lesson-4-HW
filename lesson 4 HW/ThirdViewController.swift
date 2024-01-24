//
//  ThirdViewController.swift
//  lesson 4 HW
//
//  Created by fortune cookie on 1/23/24.
//

import UIKit

class ThirdViewController: UIViewController {

    private lazy var leftArrowButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowshape.left.fill"), for: .normal
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
        label.text = "Steps left:\(total)"
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        view.backgroundColor = .white
       
   
     
        
       
        
    }
    func setupViewController(){
        view.addSubview(leftArrowButton)
        view.addSubview(bottomArrowButton)
        view.addSubview(loseLabel)
        view.addSubview(tryAgain)
        leftArrowButton.translatesAutoresizingMaskIntoConstraints = false
        bottomArrowButton.translatesAutoresizingMaskIntoConstraints = false
        loseLabel.translatesAutoresizingMaskIntoConstraints = false
        tryAgain.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftArrowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -280),
            leftArrowButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            bottomArrowButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomArrowButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            loseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loseLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tryAgain.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tryAgain.topAnchor.constraint(equalTo: loseLabel.bottomAnchor, constant: 10)
            
        ])
        leftArrowButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        leftArrowButton.heightAnchor.constraint(equalToConstant: 250).isActive = true
        bottomArrowButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        bottomArrowButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
      
        
        if total == 0{
            loseGAme()
        }else{
            stepsCount()
        }
    
    }
 
    func loseGAme(){
        tryAgain.isHidden = false
        loseLabel.text = "You Lose!"
        print(total)
        
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
