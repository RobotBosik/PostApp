//
//  ViewController.swift
//  PostApp
//
//  Created by Тарас Коваль on 26.04.24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previosButton: UIButton!
    
    @IBOutlet weak var postFoto: UIImageView!
    
    @IBOutlet weak var textFieldDescription: UITextField!
    @IBOutlet weak var textFieldTitle: UITextField!
    
    @IBOutlet weak var textTitle: UILabel!
    @IBOutlet weak var textDescription: UILabel!
    
    struct Post {
        var image: UIImage
        var title: String
        var description: String
        
    }
    var posts: [Post] = []
    var currentIndex = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        addPost()
        setupUI()
        updateView(with: posts[currentIndex])
        //test
    }
    
    func setupUI() {
        let buttons = [editButton, nextButton, previosButton]
        buttons.forEach { setButtonStyle(button: $0!) }
            
        setTextFieldStyle(textField: textFieldDescription)
        postFoto.layer.cornerRadius = 8
        }
    
    func addPost() {
        let post1 = Post(image: UIImage(named: "tree")!, title: "New post", description: "Beautiful tree in the middle of a field covered with grass with the tree line in the background")
        
        let post2 = Post(image: UIImage(named: "forest")!, title: "Forest", description: "A forest is an area with a high density of trees. Plant communities formed in such areas are typical of large land areas in different parts of the world. Their most important functions in the biosphere are to sequester carbon dioxide, create habitats suitable for many species of animals, plants, and fungi, regulate the hydrological regime, and develop and maintain soils.")
        
        let post3 = Post(image: UIImage(named: "desert")!, title: "Desert", description: "Deserts are a type of landscape characterized by a flat surface, sparse or absolute absence of flora, and specific and inherent species of fauna.")
        
        let post4 = Post(image: UIImage(named: "hills")!, title: "Hills", description: "A mountain, or mountain structure, is a form of relief characterized by a sharp, localized, isolated elevation of the earth’s surface above neighboring relatively level areas. It is defined by a clear boundary (the transition from plain to mountain) and sharp fluctuations in relative heights. In general, mountains are considered relief elements with absolute heights of more than 600 meters above sea level.")
        
        posts = [post1, post2, post3, post4]
    }
    
    func updateView(with post: Post) {
        postFoto.image = post.image
        textTitle.text = post.title
        textDescription.text = post.description
    }
    
    func setTextFieldStyle(textField : UITextField) {
        textField.layer.borderColor = UIColor(named: "mainBlue30")?.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.setLeftPaddingPoints(20)
        
        
    }
    
    func setButtonStyle(button: UIButton) {
        button.layer.cornerRadius = 8
        button.applyGradient(colors: [UIColor(red: 0.02, green: 0.33, blue: 0.69, alpha: 0.30).cgColor, UIColor(red: 0.02, green: 0.33, blue: 0.69, alpha: 0.20).cgColor, UIColor(red: 0.02, green: 0.33, blue: 0.69, alpha: 0.30).cgColor])
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        currentIndex = (currentIndex + 1) % posts.count
        updateView(with: posts[currentIndex])
    }
    
    @IBAction func previousButtonTapped(_ sender: UIButton) {
        currentIndex = (currentIndex - 1 + posts.count) % posts.count
        updateView(with: posts[currentIndex])
    }
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                
            if let editViewController = storyboard.instantiateViewController(withIdentifier: "edit") as? EditViewController {
                
                let postToEdit = posts[currentIndex]
                
                editViewController.imageEdit = postToEdit.image
                editViewController.titleFieldEdit = postToEdit.title
                editViewController.descriptionFieldEdit = postToEdit.description
                
                editViewController.onSave = { [weak self] image, title, description in
            
                        self!.posts[self!.currentIndex].image = image
                        self!.posts[self!.currentIndex].title = title
                        self!.posts[self!.currentIndex].description = description
                            
                self!.updateView(with: self!.posts[self!.currentIndex])

                        }
                
                self.present(editViewController, animated: true, completion: nil)
            }
    }
    
}

extension UIButton {
    func applyGradient(colors : [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.locations = [0,0.5,1]
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: amount*2))
        self.leftView = paddingView
        self.leftViewMode = .always
        
    }
}
