//
//  StartViewController.swift
//  lesson 4 HW
//
//  Created by fortune cookie on 1/23/24.
//

import UIKit

class StartViewController: UIViewController {

    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        button.addTarget(self, action: #selector(startGame
                                                ), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
      
        
    }
    func setupView(){
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    @objc func startGame(){
        total = 0
        total += 3
        let firstViewController = ViewController()
        navigationController?.pushViewController(firstViewController, animated: false)
    }
}
