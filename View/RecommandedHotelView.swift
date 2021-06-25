//
//  RecommandedHotelView.swift
//  MAnDAr_App
//
//  Created by arizngy on 17/06/2021.

import UIKit

class RecommandedHotelView: UIView {
    
    let recommendedCellId = "recommendedCellId"
    let recommendedHotelLabel: UILabel = {
       let rhv = UILabel()
        rhv.text = "Recommended Hotels"
        rhv.textColor = UIColor.darkGray
        rhv.translatesAutoresizingMaskIntoConstraints = false
        rhv.font = UIFont.boldSystemFont(ofSize: 16)
        return rhv
    }()
    
    var homeViewController: HomeViewController?
    
    lazy var ViewMoreLabel: UILabel = {
        let vml = UILabel()
        vml.text = "View More"
        vml.textColor = UIColor.darkGray
        vml.translatesAutoresizingMaskIntoConstraints = false
        vml.font = UIFont.systemFont(ofSize: 13)
        vml.textAlignment = .right
        let labelTapped = UITapGestureRecognizer(target: self, action: #selector(ViewMoreTapped))
        vml.isUserInteractionEnabled = true
        vml.addGestureRecognizer(labelTapped)
        return vml
    }()
    
    lazy var recommendedHotelCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
       let rhcv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        rhcv.translatesAutoresizingMaskIntoConstraints = false
        rhcv.delegate = self
        rhcv.dataSource = self
        rhcv.backgroundColor = UIColor.white
        return rhcv
    }()
    
    let recommendedHotels = [Hotel(name: "Hotel Belarus Minsk",imageName: "Belarus",price:40,number_of_stars: 3,hotel_description: "For many years, Hotel “Belarus“ in Minsk has been a symbol and one of the most recognizable architectural monuments of Minsk. Hotel “Belarus”, being the hallmark of Minsk, for many years has maintained the status of the best hotel in the capital. Convenient location in the centre of Minsk, the harmony of style and comfort, a wide range of services, the ability to accept and accommodate a large number of guests make Hotel “Belarus” a popular place of temporary residence for both business and leisure travelers alike."), Hotel(name: "Cosmos Hotel Moscow",imageName: "Cosmos",price:220,number_of_stars: 5, hotel_description: "The legendary Hotel Cosmos is located at Prospect Mira - one of the main arterial roads of Moscow. The hotel borders green areas on the north-east of the capital, the oasis of peace and tranquility - National Park “Losiniy Ostrov” (literally - Elk Island or Moose Island). The main exposition, museum and recreational complex of the country, The Exhibition of Achievements of National Economy (VDNKh), is located just opposite the Hotel Cosmos. While staying at the Hotel Cosmos, you can always find an exhibition or entertainment to your taste."),Hotel(name: "Akyan Hotel Saint-Petersburg",imageName: "Akyan",price:170,number_of_stars: 4, hotel_description: "AKYAN St.Petersburg Hotel is located in the heart of St.Petersburg, just five minutes from the Nevsky prospect — the main street of the Northern Capital. In walking distance from the hotel is the Moscow Railway Station and metro station «Ploshchad Vosstania», many famous sights, museums and theaters, as well as all the necessary space to spend time with benefit and pleasure. Shoppers will appreciate the close proximity of the two shopping centers — «Stockmann» and «Gallery», one of the largest in Europe. In addition to high-quality shopping, here offers a variety of entertainment: cinema, specific restaurants, sports complex, SPA. Cozy cafes, gourmet restaurants and other atmospheric space for every taste are also adjacent to the hotel."), Hotel(name: "Atrium Hotel Mogilev", imageName: "Atrium", price:60, number_of_stars: 3, hotel_description: "ATRIUM Hotel is a new modern hotel in Mogilev city located in the very city center just a few steps from the Central Department Store and the main pedestrian street Leninskaya. Whether you are a business traveller, a guest wishing to explore the city or you‘re simply looking for a weekend gateway – ATRUM Hotel is a perfect place for business and leisure. ATRIUM guests will appreciate a high level of service, genuine hospitality and functional comfort."), Hotel(name: "Borovlyany Hotel", imageName: "Dom", price:40, number_of_stars: 3, hotel_description: "We're connected to Galleria Minsk and less than two kilometers from Old Town and Nemiga Underground Station. Independence Square, the Great Patriotic War museum, Minsk Areana, and Dinamo Stadium are within a 10-minute drive. Enjoy magnificent city views, a fitness center, and a warm DoubleTree welcome cookie on arrival."), Hotel(name: "Privolny Hotel", imageName: "PrivolnyH", price: 200, number_of_stars: 5, hotel_description: "We're right next to the main train station, and 10 minutes' walk from the metro. Stolitsa shopping center, beneath Independence Square, is less than a kilometer from us. Return to eat in our restaurant, and relax in our 24-hour bar. Access to our fitness center, daily hot breakfast and WiFi are included in your stay.")]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(recommendedHotelLabel)
        addSubview(ViewMoreLabel)
        addSubview(recommendedHotelCollectionView)
        recommendedHotelCollectionView.register(RecommandedHotelCollectionViewCell.self, forCellWithReuseIdentifier: recommendedCellId)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":recommendedHotelLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(30)]-20-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":recommendedHotelLabel,"v1":recommendedHotelCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(100)]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":ViewMoreLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":ViewMoreLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":recommendedHotelCollectionView]))
    }
    
    
    
}

extension RecommandedHotelView: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recommendedCellId, for: indexPath) as! RecommandedHotelCollectionViewCell
        cell.hotel = recommendedHotels[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeViewController?.passedHotel = recommendedHotels[indexPath.item]
        homeViewController?.displayDetailHotel()
    }
    
    @objc func ViewMoreTapped() {
        homeViewController?.recommendedHotels = recommendedHotels
        homeViewController?.showMoreRecommendedHotels()
    }
    
}
