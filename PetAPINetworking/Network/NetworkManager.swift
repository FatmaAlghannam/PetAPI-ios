//
//  NetworkManger.swift
//  PetAPINetworking
//
//  Created by fatma adnan on 04/03/2024.
//

import Foundation
import Alamofire
class NetworkManager{
    
    //MARK: API
    private let baseURL = "https://coded-pets-api-crud.eapi.joincoded.com/pets"
    
    //MARK: SINGLETON
    static let shared = NetworkManager()
    
    //MARK: HTTP Methods:
    
    ///get method
    func fetchPets(complestion: @escaping ([Pet]?) -> Void){
        //responseDecodable: its in alamofire
        AF.request(baseURL).responseDecodable(of: [Pet].self) { response in
            switch response.result {
                
            case.success(let pet):
                complestion(pet)
                
            case.failure(let error):
                complestion(nil)
                print(error)
                
            }
        }
        
        
    }
    
    //post method
    func addPet(pet: Pet, completion: @escaping (Bool) -> Void) {
        AF.request(baseURL , method: .post , parameters: pet , encoder: JSONParameterEncoder.default).response{response in
            
            switch response.result{
                
            case.success(_):
                completion(true)
            case.failure(let error):
                completion(false)
                print(error)
            }
        }
    }
    //delet method
    func deletePet(petID: Int, completion: @escaping (Bool) -> Void){
        AF.request("\(baseURL)/\(petID)",method: .delete).response{ response in
            switch response.result{
                
            case.success(_):
                completion(true)
            case.failure(let error):
                completion(false)
                print(error)
            }
        }
    }
}
