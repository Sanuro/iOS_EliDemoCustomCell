//
//  AddEditVCViewController.swift
//  eliDemoCustomCell
//
//  Created by Jaewon Lee on 7/11/18.
//  Copyright © 2018 Jaewon Lee. All rights reserved.
//

import UIKit

class AddEditVCViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "UnwindToVC", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
