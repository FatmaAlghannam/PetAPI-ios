//
//  ViewController.swift
//  PetAPINetworking
//
//  Created by fatma adnan on 04/03/2024.
//

import UIKit

class PetTableViewController : UITableViewController {
    
    // variable
    var pets: [Pet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
         fetchPetsData()
        setupNav()
        setupNaviBar()
    }
    // call the extension function
    // register the cell for cellforrowat
    // numberofrowsinsection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    
   
    private func setupNaviBar() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.app"),
        style: .plain,
        target: self,
        action: #selector(NavPet))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.systemBlue
    }
    

//    @objc private func AddPetV() {
//        let navigationController = UINavigationController(rootViewController: AddBookViewController())
//        present(navigationController, animated: true, completion: nil)
//    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let petToDelete = pets[indexPath.row]
            NetworkManager.shared.deletePet(petID: petToDelete.id!) { success in
                DispatchQueue.main.async {
                    if success{
                        
                        self.pets.remove(at: indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .fade)
                        
                        //or remove data
                        //weak self no leek
                        
                    }else{
                        print("Nothing happen")
                    }
                }
            }
        }
    }
    
    @objc func setupNav(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    //cellforrowat
    //return
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let pet = pets[indexPath.row]
        cell.textLabel?.text = pet.name
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let  mypetVc = PetViewController()
        let selectedPet = pets[indexPath.row]
        
        mypetVc.pet = selectedPet
        navigationController?.pushViewController(mypetVc, animated: true)
    }
    
    

                                                
    @objc func NavPet(){
    let PetVC = UINavigationController(rootViewController:  AddPetViewController())
    PetVC.modalPresentationStyle = .popover
    self.present(PetVC, animated: true)
}






                                                            }
// MARK: extension TBD:
extension PetTableViewController {
    // MARK: NetworkClass Function:
    func fetchPetsData(){
        NetworkManager.shared.fetchPets{ fetchPets in
            DispatchQueue.main.async {
              //  print(fetchPets)
            self.pets = fetchPets ?? []
            self.tableView.reloadData()
                
            }
        }
    }
}
