//
//  PetViewController.swift
//  PetAPINetworking
//
//  Created by fatma adnan on 04/03/2024.
//

import UIKit
import Alamofire
import SnapKit
import Kingfisher

class PetViewController: UIViewController {
    
    var pet: Pet?
    
    private let nameLabel = UILabel( )
    private let idLabel = UILabel( )
    private let ageLabel = UILabel( )
    private let adoptedlLabel = UILabel( )
    private let genderLabel = UILabel( )
    private let petImageView = UIImageView( )
    private let cardView = UIView()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nameLabel)
        view.addSubview(idLabel)
        view.addSubview(ageLabel)
        view.addSubview(adoptedlLabel)
        view.addSubview(genderLabel)
        view.addSubview(petImageView)
        
        //card shape :
        view.addSubview(cardView)
        cardView.addSubview(nameLabel)
        cardView.addSubview(idLabel)
        cardView.addSubview(ageLabel)
        cardView.addSubview(adoptedlLabel)
        cardView.addSubview(genderLabel)
        cardView.addSubview(petImageView)
        
        
        
        
        
        
        setupLayout()
        setupUI()
        configureWithPets()
       // setConstraints()
        
    }
    
    func  setupUI(){
        view.backgroundColor = .white
        

        nameLabel.font = .systemFont(ofSize: 19, weight: .bold)
        idLabel.font = .systemFont(ofSize: 19, weight: .medium)
        genderLabel.font = .systemFont(ofSize: 19)
        ageLabel.font = .systemFont(ofSize: 19)
        adoptedlLabel.font = .systemFont(ofSize: 19)
        // image
        
    }
    func   setupLayout(){
        petImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(75)
        }
        petImageView.layer.cornerRadius = 37.5
        petImageView.clipsToBounds = true
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(petImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        idLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(idLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        adoptedlLabel.snp.makeConstraints { make in
            make.top.equalTo(ageLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(adoptedlLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        cardView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(150)
        }
        
    }
    
    func configureWithPets(){
        
        nameLabel.text = pet?.name
        idLabel.text = "\(pet?.id ?? 0)"
        genderLabel.text = pet?.gender
        ageLabel.text = "\(pet?.age ?? 0)"
        adoptedlLabel.text = "\(pet?.adopted ?? false)"
        petImageView.kf.setImage(with: URL(string: pet?.image ?? ""))
    }
    
    
//    func setConstraints() {
//        cardView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.equalTo(200)
//            make.height.equalTo(150)
//        }
        
        
        
    }
    
    


