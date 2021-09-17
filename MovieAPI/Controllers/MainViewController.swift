//
//  MainViewController.swift
//  MovieAPI
//
//  Created by Coti on 14/09/2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func button(_ sender: Any) {
        if textField.text!.contains("@") && textField.text!.contains(".com"){
            //presentar la otra vista
            presentMovies()
            
        
        } else {
            let alert = UIAlertController(title: "Email incorrecto", message: "Por favor ingrese un email válido, por ejemplo pedrogomez@gmail.com.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reintentar", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    func presentMovies(){
        let moviesViewController = MoviesViewController(nibName: "MoviesViewController", bundle: nil)
        moviesViewController.modalPresentationStyle = .overFullScreen //mostrar pantalla completa
        self.present(moviesViewController, animated: true)
    }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


