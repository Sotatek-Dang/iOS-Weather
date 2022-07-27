//
//  BaseViewController.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        setupUI()
        loadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func setupUI() {
        setupNavigationbarColor()
    }
    
    func loadData() {
        // TODO: Load default data from ViewModel
    }
    
    // MARK: - Navigation Bar
    func setupNavigationbarColor() {
        guard let navigationBar = navigationController?.navigationBar else {return}

        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundImage = UIColor.black.navBarImage()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // With a red background, make the title more readable.
            navigationItem.standardAppearance = appearance
            navigationItem.scrollEdgeAppearance = appearance
        } else {
            navigationBar.setBackgroundImage(UIColor.black.navBarImage(), for: .default)
        }
    }
    
    func hideNavigationBar(isHide: Bool = true) {
        self.navigationController?.navigationBar.isHidden = isHide
    }
    
    func addLeftBarItem(imageName : String, selectedImage: String, title : String) {
        let leftButton = UIButton.init(type: UIButton.ButtonType.custom)
        leftButton.isExclusiveTouch = true
        leftButton.isSelected       = false
        leftButton.frame            = CGRect.init(x: 0, y: 0, width: 40, height: 40)
        leftButton.addTarget(self, action: #selector(tappedLeftBarButton(sender:)), for: UIControl.Event.touchUpInside)
        if title.count > 0 {
            leftButton.frame = CGRect.init(x: 0, y: 0, width: 80, height: 40)
            leftButton.setTitle(title, for: UIControl.State.normal)
            leftButton.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -10, bottom: 0, right: 10)
        }
        if imageName.count > 0 {
            leftButton.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -10, bottom: 0, right: 10)
            leftButton.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
            leftButton.setImage(UIImage.init(named: imageName), for: UIControl.State.normal)
            leftButton.setImage(UIImage.init(named: selectedImage), for: UIControl.State.selected)
        }
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftButton)
        self.navigationItem.leftBarButtonItem?.imageInsets = UIEdgeInsets.init(top: 0, left: -10, bottom: 0, right: 10)
    }
    
    func addRightBarItem(imageName : String, imageTouch: String, title : String) {
        let rightButton = UIButton.init(type: UIButton.ButtonType.custom)
        rightButton.isExclusiveTouch = true
        rightButton.addTarget(self, action: #selector(tappedRightBarButton(sender:)), for: UIControl.Event.touchUpInside)
        if title.count > 0 {
            rightButton.frame = CGRect.init(x: 0, y: 0, width: 70, height: 70)
            rightButton.setTitle(title, for: UIControl.State.normal)
            rightButton.titleLabel?.textAlignment = .right
            rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            rightButton.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 5, bottom: 0, right: -5)
        }
        if imageName.count > 0 {
            rightButton.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
            rightButton.setImage(UIImage.init(named: imageName), for: UIControl.State.normal)
            rightButton.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: -10)
            rightButton.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: -15)
        }
        if imageTouch.count > 0 {
            rightButton.setImage(UIImage.init(named: imageTouch), for: .selected)
        }
        
        self.navigationItem.rightBarButtonItem?.imageInsets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: -10)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightButton)
    }
    
    func addTitle(title : String) {
        self.title = title
    }

    // MARK: - NavigationBar Action
    @objc func tappedLeftBarButton(sender : UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func tappedRightBarButton(sender : UIButton) {
    }
}
