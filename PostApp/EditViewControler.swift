import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var postFoto: UIImageView!
    
    @IBOutlet weak var textFieldDescription: UITextField!
    @IBOutlet weak var textFieldTitle: UITextField!
    
    struct Post {
        var image: UIImage
        var title: String
        var description: String
        
    }
    
    var onSave: ((UIImage, String, String)-> Void)?
    
    var imageEdit: UIImage = UIImage(named: "tree")!
    var titleFieldEdit: String = "New post"
    var descriptionFieldEdit: String = "New post"
    
   
    
    override func viewDidLoad() {
        let post = Post(image: imageEdit, title: titleFieldEdit, description: descriptionFieldEdit)

        setupUI()
        updateView(with: post)
        super.viewDidLoad()
    }
    
    func setupUI() {
        setingTextField(textField: textFieldTitle)
        setingTextField(textField: textFieldDescription)
        
        for button in [saveButton, cancelButton] {
            setingButton(button: button!)
        }
        
        postFoto.layer.cornerRadius = 8

        
    }
    
    func updateView(with post: Post) {
        postFoto.image = post.image
        textFieldTitle.text = post.title
        textFieldDescription.text = post.description
    }
    
    func setingTextField(textField : UITextField) {
        textField.layer.borderColor = UIColor(named: "mainBlue30")?.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.setLeftPaddingPoints(20)
        
        
    }
    
    func setingButton(button: UIButton) {
        button.layer.cornerRadius = 8
        button.applyGradient(colors: [UIColor(red: 0.02, green: 0.33, blue: 0.69, alpha: 0.30).cgColor, UIColor(red: 0.02, green: 0.33, blue: 0.69, alpha: 0.20).cgColor, UIColor(red: 0.02, green: 0.33, blue: 0.69, alpha: 0.30).cgColor])
    }
    

    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {

    dismiss(animated: true, completion: nil)

    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
                
        onSave?(imageEdit, textFieldTitle.text ?? "", textFieldDescription.text ?? "")
        
            dismiss(animated: true, completion: nil)
    }
    
}

