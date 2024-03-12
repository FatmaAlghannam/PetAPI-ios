//
//  AddPetViewController.swift
//  PetAPINetworking
//
//  Created by fatma adnan on 05/03/2024.
//

import UIKit
import Eureka
class AddPetViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupForm()
        
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(submitTapped))
    }
    
    func setupForm() {
        form +++ Section("Add New Pet")
        <<< TextRow() { row in
            row.title = "Name"
            row.placeholder = "Enter Pet Name"
            row.tag = "Name"
            //Should write title and placeholder
            
            //red color and error
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid{
                    cell.titleLabel?.textColor = .red
                }
            }
        }
        <<< IntRow() { row in
            row.title = "Age"
            row.placeholder = "Enter Pet Age"
            row.tag = "Age"
            
            //red color and error
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid{
                    cell.titleLabel?.textColor = .red
                }
            }
            
        }
        <<< TextRow() { row in
            row.title = "Gender"
            row.placeholder = "Enter Pet Gender"
            row.tag = "Gender"
            //red color and error
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid{
                    cell.titleLabel?.textColor = .red
                }
            }
            
        }
        <<< TextRow() { row in
            row.title = "Adopted"
            row.placeholder = "Required Adopted"
            row.tag = "Pet Adopted"
            //red color and error
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid{
                    cell.titleLabel?.textColor = .red
                }
            }
        }
        <<< URLRow() { row in
            row.title = "image"
            row.placeholder = "Required URL"
            row.tag = "Pet Image"
            
            //red color and error
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid{
                    cell.titleLabel?.textColor = .red
                }
            }
        }
        form +++ Section("")
        
        //button submit
        <<< ButtonRow () { row in
            row.title = "ADD"
            row.onCellSelection { cell, row in
                print("DONE")
                self.submitTapped()
                
            }
        }
    }
    //enaum tags bonus for the naming tags.description only on tags
    //addbooks.
    
    @objc func submitTapped() {
        
        //validation "n7ker al user in the guard"
        let errors = form.validate()
        guard  errors.isEmpty else{
            print(errors)
            print("something wrong")
            
            presentAlertWithTitle(title: "Not found", message: "is empty")
            
            //other way to find error in each cell but not complete :
            //var countingError = errors.count
            //presentAlertWithTitle(title: "Not found", message: \ ,,, "is empty")
            
            return
        }
        
        
        //getting data from the row
        let nameRow: TextRow? = form.rowBy(tag: "Name")
        let ageRow: IntRow? = form.rowBy(tag: "Age")
        let adoptedRow: TextRow? = form.rowBy(tag: "Adopted")
        let genderRow: TextRow? = form.rowBy(tag: "Gender")
        let imageRow: URLRow? = form.rowBy(tag: "Image")
        
        
        
        
        
        //convert data to string ,INT ,etc
        let name = nameRow?.value ?? ""
        let age = ageRow?.value ?? 0
        let adopted = adoptedRow?.value ?? ""
        let gender = genderRow?.value ?? ""
        let image = imageRow?.value?.absoluteString ?? ""
        
        
        
        print(name)
        let pet = Pet(name: name, adopted: false, image: image, age: age, gender: gender)
        
        
        
        NetworkManager.shared.addPet(pet: pet) { success in
            DispatchQueue.main.async {
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                }
            }
        }
    }
    
    private func presentAlertWithTitle(title: String, message: String) {
          let alert = UIAlertController(title: title, message: message,
                                        preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .default))
          present(alert, animated: true, completion: nil)
      }

}
