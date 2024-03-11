import UIKit

class FourthViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var resultTextView: UITextView!
    @IBOutlet var imageView: UIImageView!
    
    var stringText: String = " "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        resultTextView?.text = stringText
    }
    
    @IBAction func uploadImageButtonTapped(_ sender: UIButton) {
        // Create an image picker controller
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: - UIImagePickerControllerDelegate

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // Dismiss the image picker controller
            picker.dismiss(animated: true, completion: nil)

            // Retrieve the selected image and display it in the image view
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                imageView.image = image
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the image picker controller if the user cancels
        picker.dismiss(animated: true, completion: nil)
    }
}
