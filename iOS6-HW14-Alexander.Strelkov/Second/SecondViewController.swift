//
//  SecondViewController.swift
//  iOS6-HW14-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 07.06.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    //MARK: - Views
    
//    private lazy var button: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Press me", for: .normal)
//        button.addTarget(self, action: #selector(tapButtonAction), for: .touchUpInside)
//        return button
//    }()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    //MARK: - Initial
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {
        
    }
    
    //MARK: - Actions
    
    @objc private func tapButtonAction() {
        
    
    }
    
    
}
