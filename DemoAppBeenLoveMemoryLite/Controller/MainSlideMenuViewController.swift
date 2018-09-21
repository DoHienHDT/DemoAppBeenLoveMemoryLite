//
//  MainSlideMenuViewController.swift
//  DemoAppBeenLoveMemoryLite
//
//  Created by dohien on 28/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import UIKit
import Firebase
class MainSlideMenuViewController: UIViewController , DatePickerViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var refArtistis: DatabaseReference?
    
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var nameGirlTextField: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var yearDataLabel: UILabel!
    @IBOutlet weak var monthDataLabel: UILabel!
    @IBOutlet weak var weekDataLabel: UILabel!
    @IBOutlet weak var dayDataLabel: UILabel!
    @IBOutlet weak var hourDataLabel: UILabel!
    @IBOutlet weak var minuteDataLabel: UILabel!
    @IBOutlet weak var secondDataLabel: UILabel!
    @IBOutlet weak var loveDataLabel: UILabel!
    
    @IBOutlet weak var photoImageBoy: DesignableUI!
    @IBOutlet weak var photoImageGirl: DesignableUI!
    
    @IBOutlet weak var btnTapgetNameA: UIButton!
    @IBOutlet weak var btnTapgetNameB: UIButton!
    @IBOutlet weak var photoImageLove: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        getUserDefaults()
        do {
            if let entity = try AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity] {
                photoImageBoy.image = entity.last?.imageBoy as? UIImage
                photoImageGirl.image = entity.last?.imageGirl as? UIImage
            }
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
       
   
        // Do any additional setup after loading the view, typically from a nib.
    }
    func getUserDefaults() {
        if let datePicker = UserDefaults.standard.string(forKey: "datePicker") {
            dateLabel.text = datePicker + "Days"
        }
        if let name = UserDefaults.standard.string(forKey: "name")   {
            nameTextField.text = name
        }
        if let nu = UserDefaults.standard.string(forKey: "nu") {
            nameGirlTextField.text = nu
        }
        if let loveData = UserDefaults.standard.string(forKey: "loveData") {
            loveDataLabel.text = loveData
        }
        if let year = UserDefaults.standard.string(forKey: "year") {
            yearDataLabel.text = year
        }
        if let month = UserDefaults.standard.string(forKey: "month") {
            monthDataLabel.text = month
        }
        if let week = UserDefaults.standard.string(forKey: "week") {
            weekDataLabel.text = week
        }
        if let day = UserDefaults.standard.string(forKey: "day") {
            dayDataLabel.text = day
        }
        if let hour = UserDefaults.standard.string(forKey: "hour") {
            hourDataLabel.text = hour
        }
        if let minute = UserDefaults.standard.string(forKey: "minute") {
            minuteDataLabel.text = minute
        }
        if let second = UserDefaults.standard.string(forKey: "second") {
            secondDataLabel.text = second
        }
//        let ref = Database.database().reference()
//        ref.child("dayLove").setValue(["year": yearDataLabel.text,
//            "month": monthDataLabel.text,
//            "week": weekDataLabel.text,
//            "day": dayDataLabel.text,
//            "hour": hourDataLabel.text,
//            "minute": minuteDataLabel.text,
//            "second": secondDataLabel.text])
//        ref.child("date").setValue(loveDataLabel.text)
//        ref.child("dateLove").setValue(dateLabel.text)
//        ref.child("nameBoy").setValue(nameTextField.text)
//        ref.child("nameGirl").setValue(nameGirlTextField.text)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 1, delay: 0.25, options: [.autoreverse, .repeat], animations: {
            self.photoImageLove.frame.origin.y -= 20
        }, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func menuBtn(_ sender: UIButton) {
        var alertController: UIAlertController?
        alertController = UIAlertController(title: "࿐bëën lövë mëmörÿ✿‿", message: "", preferredStyle: .alert)
        alertController?.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Enter something"
        })
        let action = UIAlertAction(title: "Change name", style: UIAlertActionStyle.default, handler: {[weak self]
            (paramAction: UIAlertAction!) in
            if let textFields = alertController?.textFields {
                let enteredText = textFields[0].text
                self?.nameTextField.text = enteredText
                UserDefaults.standard.set(self?.nameTextField.text, forKey: "name")
            }
        })
        alertController?.addAction(action)
        self.present(alertController!, animated: true, completion: nil)
        let key = refArtistis?.childByAutoId().key
        let artist = ["id": key,
                      "NameBoy": nameTextField.text
                      ]
        refArtistis?.child(key!).setValue(artist)
    }
    
    
    @IBAction func menuBtnGirlName(_ sender: UIButton) {
        var alertController: UIAlertController?
        alertController = UIAlertController(title: "࿐bëën lövë mëmörÿ✿‿", message: "", preferredStyle: .alert)
        alertController?.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Enter something"
        })
        let action = UIAlertAction(title: "Change name", style: UIAlertActionStyle.default, handler: {[weak self]
            (paramAction: UIAlertAction!) in
            if let textFields = alertController?.textFields {
                let enteredText = textFields[0].text
                self?.nameGirlTextField.text = enteredText
                let key = self?.refArtistis?.childByAutoId().key
                let artist = ["id": key,
                              "NameBoy": self?.nameGirlTextField.text
                ]
                self?.refArtistis?.child(key!).setValue(artist)
                UserDefaults.standard.set(self?.nameGirlTextField.text, forKey: "nu")
            }
        })
        alertController?.addAction(action)
        self.present(alertController!, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailMainSlideMenuViewController = segue.destination as? DatePickerViewController {
            detailMainSlideMenuViewController.delegate = self
        }
    }
    func senDataLove(data: String) {
        loveDataLabel.text = data
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy"
        let srartDate = data
        let formatedStartDate = dateFormat.date(from: srartDate)
        let currentDate = Date()
        let components = Set<Calendar.Component>([.year, .month, .weekOfMonth, .day, .hour, .minute,.second])
        let differenceOfDate = Calendar.current.dateComponents(components, from:  formatedStartDate!, to: currentDate)
        yearDataLabel.text = differenceOfDate.year?.description
        monthDataLabel.text = differenceOfDate.month?.description
        weekDataLabel.text = differenceOfDate.weekOfMonth?.description
        dayDataLabel.text = differenceOfDate.day?.description
        hourDataLabel.text = differenceOfDate.hour?.description
        minuteDataLabel.text = differenceOfDate.minute?.description
        secondDataLabel.text = differenceOfDate.second?.description
        UserDefaults.standard.set(yearDataLabel.text, forKey: "year")
        UserDefaults.standard.set(monthDataLabel.text, forKey: "month")
        UserDefaults.standard.set(weekDataLabel.text, forKey: "week")
        UserDefaults.standard.set(dayDataLabel.text, forKey: "day")
        UserDefaults.standard.set(hourDataLabel.text, forKey: "hour")
        UserDefaults.standard.set(minuteDataLabel.text, forKey: "minute")
        UserDefaults.standard.set(secondDataLabel.text, forKey: "second")
        let key = refArtistis?.childByAutoId().key
        let artist = ["id": key,
                      "year": yearDataLabel.text,
                      "month": monthDataLabel.text,
                      "week": weekDataLabel.text,
                      "day": dayDataLabel.text,
                    "hour": hourDataLabel.text,
                    "minute": minuteDataLabel.text,
                    "second": secondDataLabel.text
                      ]
        let loveData = ["id": key,
                        "loveData": loveDataLabel.text
                             ]
        refArtistis?.child(key!).setValue(artist)
        refArtistis?.child(key!).setValue(loveData)
    }
    func senDataPicker(senData: String) {
        yearDataLabel.text = senData
    }
    @IBAction func selectedBtnImageA(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        check = true
        present(imagePickerController, animated: true , completion:  nil)
    }
    @IBAction func selectedBtnImageB(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        check = false

        present(imagePickerController, animated: true , completion:  nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    var check = true
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        
        if check
        {
            photoImageBoy.image = selectedImage
        } else {
            photoImageGirl.image = selectedImage
        }
        let entity = Entity(context: AppDelegate.context)
        entity.imageBoy = photoImageBoy.image
        entity.imageGirl = photoImageGirl.image
        AppDelegate.saveContext()
        dismiss(animated: true, completion: nil)
    }
    
  
    
    
    //    @IBAction func dateNumber(_ sender: UIButton) {
    //        var alertController: UIAlertController?
    //        alertController = UIAlertController(title: "Some Title", message: "Enter a text", preferredStyle: .alert)
    //        alertController?.addTextField(configurationHandler: {(textField) in
    //            self.doDatePicker()
    //            let dateFormatter = DateFormatter()
    //            dateFormatter.dateFormat = "dd-MM-yyyy"
    //            textField.inputView = self.datePicker
    //            textField.inputAccessoryView = self.toolBar
    //            textField.text = dateFormatter.string(from: self.datePicker.date)
    //        })
    //        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {[weak self ]
    //             (paramAction: UIAlertAction!) in
    //            if let textFields = alertController?.textFields {
    //                let enteredText = textFields[0].text
    //                self?.dateLabel.text = enteredText
    //
    //            }
    //        }
    //)
    //        let dateFormatter = DateFormatter()
    //        dateFormatter.dateFormat = "yyyy-MM-dd"
    //        let startDate = "2016-05-24"
    //        let formatedStartDate = dateFormatter.date(from: startDate)!
    //        let currentDate = Date()
    //        let components = Set<Calendar.Component>([.second, .minute, .weekOfMonth, .hour, .day, .month , .year])
    //        let differenceOfDate = Calendar.current.dateComponents(components, from: (formatedStartDate), to: currentDate)
    //        print(differenceOfDate)
    //
    //        alertController?.addAction(action)
    //        self.present(alertController!, animated: true, completion: nil)
    //    }
    //    func doDatePicker(){
    //        self.datePicker = UIDatePicker(frame: CGRect(x: 0, y: self.view.frame.size.height - 220, width: self.view.frame.size.width, height: 216))
    //        self.datePicker.backgroundColor = UIColor.white
    //        datePicker.datePickerMode = .date
    //        toolBar.sizeToFit()
    //        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donClicked))
    //        toolBar.setItems([doneButton], animated: true)
    //    }
    //    @objc func donClicked(){
    //        let dateFormatter = DateFormatter()
    //        dateFormatter.dateFormat = "dd-MM-yyyy"
    //        dateFormatter.dateStyle = .medium
    //        dateFormatter.timeStyle = .none
    //        dateLabel.text = dateFormatter.string(from: datePicker.date)
    //}
    func senData(name: String) {
        dateLabel.text = name + "Days"
        let key = refArtistis?.childByAutoId().key
        let artist = ["id": key,
            "dateLove": dateLabel.text
        ]
        refArtistis?.child(key!).setValue(artist)
    }
}
