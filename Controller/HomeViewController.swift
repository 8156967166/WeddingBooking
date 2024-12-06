//
//  HomeViewController.swift
//  WeddingBooking
//  Created by Aneesha on 10/05/24.
//



import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var collctnView: UICollectionView!
    @IBOutlet weak var backgrdView: UIView!
    @IBOutlet weak var SearchTextField: UITextField!
    
    var catyArry = [Categories]()
    var filteredData: [Categories] = []
    
    let miDasTouchEvents = Event(
        id: 1,
        name: "Mi Das Touch Events",
        price: "₹2,00,000",
        offerings: ["Flowers", "Banner Prints", "Audio Visuals", "Decorative Draping", "Event Concept & Design", "Lighting", "Furniture Rental", "Sounds", "Mandap", "Car Decoration", "Fireworks", "Tents", "Gifts wrapping", "Home Decoration", "Centerpiece", "Table Decoration", "Venue Entrances"],
        policies: ["50% Payment On Booking", "50% Payment On Date", "Cancellation Policy - Depends On Customer"],
        about: "I am suraj varghese, the owner of Mi das touch events based in Kochi. I have been working since 2003 and have covered around 1000 weddings till now. We bring a fresh, unique approach to the event management industry. Our team understands that a properly executed event can be leveraged to support an organization’s strategic vision, incorporated into a company’s marketing plan, or used to build networks and client loyalty. As we have seen your work, we would like to request you to please share your contact details to take this ahead.",
        image: "mi_das_touch_events",
        rating: 4.5,
        link: "https://www.weddingbazaar.com/wedding-decorators/kottayam/midastouchwe",
        imageAlbum: ["imgCat1_1", "imgCat1_2", "imgCat1_3", "imgCat1_4", "imgCat1_5", "imgCat1_6", "imgCat1_7", "imgCat1_8", "imgCat1_9", "imgCat1_10", "imgCat1_11", "imgCat1_12"]
        
    )
    
   let eventCopsEntertainment = Event(
        id: 2,
        name: "Event Cops Entertainment",
        price: "₹50,000",
        offerings: ["Mandap", "Decorative Draping", "Flowers", "Banner Prints", "Audio Visuals", "Event Concept & Design", "Lighting", "Sounds", "Furniture Rental", "Car Decoration", "Tents", "Fireworks", "Home Decoration", "Centerpiece", "Venue Entrances", "Table Decoration", "Gifts wrapping"],
        policies: ["50% Payment On Booking", "50% Payment On Date", "Payment After Event - 0", "Cancellation Policy - 50 % CANCELLATION POLICY"],
        about: "I am Anushaj Shaji, the owner of Event Cops Entertainment , based in Kochi. I have been working since 2016 and have covered around 500 weddings till now. We bring a fresh, unique approach to the event management industry. Our team understands that a properly executed event can be leveraged to support an organization’s strategic vision, incorporated into a company’s marketing plan, or used to build networks and client loyalty. As you have seen our work, we would like to request you to please share your contact details to take this ahead.",
        image: "evnt_cops_entmnt",
        rating: 3.8, 
        link: "https://www.weddingbazaar.com/wedding-decorators/kochi/event-cops-entertainment",
        imageAlbum: ["imgCat1_1", "imgCat1_2", "imgCat1_3", "imgCat1_4", "imgCat1_5", "imgCat1_6", "imgCat1_7", "imgCat1_8", "imgCat1_9", "imgCat1_10", "imgCat1_11", "imgCat1_12"]
    )
    
    let akshayDecorations = Event(
        id: 3,
        name: "Akshay Decorations",
        price: "₹30,000",
        offerings: ["Flowers", "Decorative Draping", "Lighting", "Sounds", "Furniture Rental", "Mandap", "Car Decoration", "Tents", "Home Decoration", "Table Decoration", "Venue Entrances"],
        policies: ["50% Payment On Booking", "50% Payment On Date", "Cancellation Policy - No Refund"],
        about: "I am Ashwin K Kumar, Owner of Akshay Decorations, based in Kochi. Our team and I have been working since 1999 and have covered more than 20000 weddings till now. We work together with you in Decorating and coordinating your celebration, whether you are looking for an intimate low key affair, or a big romantic affair. Our expertise allows us to bring together the best suppliers and facilities, utilizing our local knowledge we can reveal to you the hidden gems.",
        image: "akshay_ decorations",
        rating: 4.5,
        link: "https://www.weddingbazaar.com/wedding-decorators/kochi/akshay-decorations",
        imageAlbum: ["imgCat2_1", "imgCat2_2", "imgCat2_3","imgCat2_4", "imgCat2_5", "imgCat2_6","imgCat2_7", "imgCat2_8","imgCat2_9","imgCat2_10", "imgCat2_11", "imgCat2_12","imgCat2_13", "imgCat2_14","imgCat2_15","imgCat2_16"]
    )
    
   let wedCrewEvent = Event(
        id: 4,
        name: "Wed Crew Events & Wwddings",
        price: "₹1,00,000",
        offerings: ["Flowers", "Decorative Draping", "Lighting", "Furniture Rental", "Sounds", "Mandap", "Car Decoration", "Fireworks", "Gifts wrapping", "Home Decoration", "Centerpiece"],
        policies: ["20% Payment On Booking", "80% Payment On Date", "Payment After Event - 0"],
        about: "I am Griger, the owner of Wed Crew Events & Wwddings, based in Kochi. I have been working since 2020 and have dolled up around 90 brides. We are giving our best to make our client's dream into reality. Believe in teamwork and providing the best service and management.",
        image: "wed_crew_events",
        rating: 4.5, 
        link: "https://www.weddingbazaar.com/wedding-decorators/kochi/wed-crew-events-weddings",
        imageAlbum: ["imgCat3_1", "imgCat3_2", "imgCat3_3","imgCat3_4"]
    )
    
    let colorsEvent = Event(
        id: 5,
        name:"Colors Events",
        price: "₹80,000",
        offerings: ["Flowers", "Banner Prints", "Audio Visuals", "Decorative Draping", "Event Concept & Design", "Lighting", "Furniture Rental", "Sounds", "Mandap", "Tents", "Gifts wrapping", "Home Decoration", "Centerpiece", "Table Decoration", "Venue Entrances"],
        policies: ["50% Payment On Booking", "50% Payment On Date", "Cancellation Policy - No Refund"],
        about: "I am Bipin, Owner of Colors Events, based in Kochi. Our team and I have been working since 2018 and have covered more than 200 weddings till now. We work together with you in Decorating and coordinating your celebration, whether you are looking for an intimate low key affair, or a big romantic affair. Our expertise allows us to bring together the best suppliers and facilities, utilizing our local knowledge we can reveal to you the hidden gems.",
        image: "Colors_Event",
        rating: 4.0,
        link: "https://www.weddingbazaar.com/wedding-decorators/kochi/colors_events",
        imageAlbum: ["imgCat4_1", "imgCat4_2", "imgCat4_3", "imgCat4_4", "imgCat4_5", "imgCat4_6", "imgCat4_7", "imgCat4_8", "imgCat4_9", "imgCat4_10", "imgCat4_11", "imgCat4_12", "imgCat4_13", "imgCat4_14", "imgCat4_15", "imgCat4_16"]
    )
    
    let thePartyBashPhotography = Event(
        id: 1,
        name: "The Party Bash Photography",
        price: "₹19,000",
        offerings: ["Candid Photography", "Traditional Photography", "Cinematic Videography", "Traditional Video", "Albums", "Pre-Wedding Shoot", "Drones"],
        policies: ["20% Payment On Booking", "60% Payment On Date", "20% Payment After Event", "Cancellation Policy - As A Wedding Photographer, It's Important To Have A Clear And Fair Booking Cancellation Policy In Place To Protect Both You And Your Clients. Here Is A Sample Policy You Could Use: Booking Cancellation Policy: Deposits And Payments: A Non-Refundable Deposit Of 50% Of The Total Cost Is Required At The Time Of Booking To Secure Your Wedding Date. The Remaining Balance Is Due Two Weeks Prior To The Wedding Date. Payments Can Be Made By Cash, Check, Or Electronic Transfer. Cancellation By The Client: In The Event That You Need To Cancel Your Booking, Please Let Us Know As Soon As Possible. The Following Cancellation Fees Will Apply: If You Cancel More Than 90 Days Prior To The Wedding Date, You Will Receive A 50% Refund Of The Deposit Paid. If You Cancel Less Than 90 Days But More Than 30 Days Prior To The Wedding Date, You Will Forfeit The Full Deposit Paid. If You Cancel Less Than 30 Days Prior To The Wedding Date, You Will Be Responsible For The Full Balance Of The Agreed-Upon Package. Cancellation By The Photographer: In The Unlikely Event That We Need To Cancel Your Booking, We Will Refund All Payments Made, Including The Deposit. We Will Make Every Effort To Find A Suitable Replacement Photographer, But If This Is Not Possible, We Will Not Be Held Liable For Any Damages Beyond The Amount Paid For The Services. Rescheduling: We Understand That Unforeseen Circumstances May Arise That Require You To Reschedule Your Wedding Date. We Will Make Every Effort To Accommodate Your New Date, Subject To Our Availability. If We Are Not Available On The New Date, Our Cancellation Policy Will Apply. We Hope This Policy Provides Clarity And Peace Of Mind For Our Clients. If You Have Any Questions Or Concerns, Please Don't Hesitate To Reach Out To Us"],
        about: "I am Bipin, Owner of Colors Events, based in Kochi. Our team and I have been working since 2018 and have covered more than 200 weddings till now. We work together with you in Decorating and coordinating your celebration, whether you are looking for an intimate low key affair, or a big romantic affair. Our expertise allows us to bring together the best suppliers and facilities, utilizing our local knowledge we can reveal to you the hidden gems.",
        image: "Colors_Event", 
        rating: 3.0,
        link: "https://www.weddingbazaar.com/wedding-photographers/raipur/the-party-bash-photography",
        imageAlbum:  ["imgCat4_1", "imgCat4_2", "imgCat4_3", "imgCat4_4", "imgCat4_5", "imgCat4_6", "imgCat4_7", "imgCat4_8", "imgCat4_9", "imgCat4_10", "imgCat4_11", "imgCat4_12", "imgCat4_13", "imgCat4_14", "imgCat4_15", "imgCat4_16"])
    
    var categoryImageArry = ["decorations_and_ambiance", "photography_and_videography", "eventsImg", "cateringImg", "cardImg", "jewellery", "outfitsImg", "salons", "floristsImg", "rental_bus", "rental_Outfits", "rental_jewellery"]
    
    var nameOfCategoryArry = ["Decorations and Ambiance", "Photography and Videography", "Events", "Catering", "Invitation Cards", "Jewellery Shops", "Outfits", "Salons", "Florists", "Rental Bus", "Rental Outfits", "Rental Jewellery" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        backgrdView.roundCorners(corners: [.bottomLeft], radius: 100)
        collctnView.delegate = self
        collctnView.dataSource = self
        setModel()
        SearchTextField.delegate = self
        filteredData = catyArry
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        filterData(for: updatedText)
        return true
    }
    
    func filterData(for query: String) {
        if query.isEmpty {
            filteredData = catyArry
        } else {
            filteredData = catyArry.filter { $0.categoryName.lowercased().contains(query.lowercased()) }
        }
        collctnView.reloadData()
    }
    
    func setModel() {
        let decorationsAndAmbiance = Categories(categoryName: "Decorations and Ambiance", events: [miDasTouchEvents, eventCopsEntertainment, akshayDecorations, wedCrewEvent, colorsEvent], imgStrg: "decorations_and_ambiance")
        let photographyandVideography = Categories(categoryName: "Photography and Videography", events: [thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography], imgStrg: "photography_and_videography")
        let evnt = Categories(categoryName: "Events", events: [thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography], imgStrg: "eventsImg")
        let catering = Categories(categoryName: "Catering", events: [thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography], imgStrg: "cateringImg")
        let invitationCards = Categories(categoryName: "Invitation Cards", events: [thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography], imgStrg: "cardImg")
        let jewelleryShops = Categories(categoryName: "Jewellery Shops", events: [thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography], imgStrg: "jewellery")
        let outfits = Categories(categoryName: "Outfits", events: [thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography], imgStrg: "outfitsImg")
        let salons = Categories(categoryName: "Salons", events: [thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography], imgStrg: "salons")
        let florists = Categories(categoryName: "Florists", events: [thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography], imgStrg: "floristsImg")
        let rentalBus = Categories(categoryName: "Rental Bus", events: [thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography], imgStrg: "rental_bus")
        let rentalOutfits = Categories(categoryName: "Rental Outfits", events: [thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography], imgStrg: "rental_Outfits")
        let rentalJewellery = Categories(categoryName: "Rental Jewellery", events: [thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography, thePartyBashPhotography], imgStrg: "rental_jewellery")
        let arry = [decorationsAndAmbiance, photographyandVideography, evnt, catering, invitationCards, jewelleryShops, outfits, salons, florists, rentalBus, rentalOutfits, rentalJewellery]
        catyArry.append(contentsOf: arry)
        print("catyArry -- \(catyArry)")
        
//        setJson()
    }
    
    func setJson() {
        print("allCategories --- \(catyArry)")
        // Encode the data into JSON
        do {
            let jsonData = try JSONEncoder().encode(catyArry)
            let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
//            print("json :: \(json)")
            if let value = json as? [[String:Any]] {
//                print("value :: \(value)")
                for i in value {
//                    print(i["events"])
                    if let evnt =  i["events"] as? [[String: Any]] {
//                        print("evnt -- \(evnt)")
                        for evntItem in evnt {
                            print("evntItem -- \(evntItem)")
                            if let name = evntItem["name"] as? String {
                                print("name - \(name)")
                            }
                        }
                        
                    }
                }
            }
        } catch {
            print("Failed to encode JSON: \(error)")
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListOfCategoriesCollectionViewCell", for: indexPath) as! ListOfCategoriesCollectionViewCell
//        cell.imgOfCategory.image = UIImage(named: categoryImageArry[indexPath.item])
//        cell.nameOfCategory.text = nameOfCategoryArry[indexPath.item]
        cell.imgOfCategory.image = UIImage(named: filteredData[indexPath.item].img)
        cell.nameOfCategory.text = filteredData[indexPath.item].categoryName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SelectedCategoryDetailsViewController") as? SelectedCategoryDetailsViewController
        selectedVC?.evntArry = filteredData[indexPath.item].events
        selectedVC?.catgryName = filteredData[indexPath.item].categoryName
        self.navigationController?.pushViewController(selectedVC!, animated: true)
    }
}
