//
//  FourthViewController.swift
//  lesson 4 HW
//
//  Created by fortune cookie on 1/23/24.
//

import UIKit

class FourthViewController: UIViewController {
    private lazy var leftArrowButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowshape.left.fill"), for: .normal
        )
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        return button
    }()
    private lazy var upArrowButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowshape.up.fill"), for: .normal
        )
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private lazy var winLabel: UILabel = {
        let label = UILabel()
        label.text = "You Won!"
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    private lazy var playAgain: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(returntToStart), for: .touchUpInside)
        button.setTitle("Play Again!", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setImage(UIImage(systemName: "arrow.circlepath"), for: .normal)
        return button
    }()
    private lazy var keyImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "key.fill")
        image.tintColor = UIColor.systemYellow
        return image
    }()
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.backgroundColor = .white
       
        print(total)
        setupViewController()
   
     
        
       
        
    }
    func setupViewController(){
        view.addSubview(leftArrowButton)
        view.addSubview(upArrowButton)
        view.addSubview(winLabel)
        view.addSubview(playAgain)
        view.addSubview(keyImage)
        leftArrowButton.translatesAutoresizingMaskIntoConstraints = false
        upArrowButton.translatesAutoresizingMaskIntoConstraints = false
        winLabel.translatesAutoresizingMaskIntoConstraints = false
        playAgain.translatesAutoresizingMaskIntoConstraints = false
        keyImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftArrowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -280),
            leftArrowButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            upArrowButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            upArrowButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            winLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            winLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            playAgain.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playAgain.topAnchor.constraint(equalTo: winLabel.bottomAnchor, constant: 10),
            keyImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 280),
            keyImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
        leftArrowButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        leftArrowButton.heightAnchor.constraint(equalToConstant: 250).isActive = true
        upArrowButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        upArrowButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        keyImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        keyImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    @objc func returntToStart(){
     let start = StartViewController()
        navigationController?.pushViewController(start, animated: false)
        
        
    }
}
