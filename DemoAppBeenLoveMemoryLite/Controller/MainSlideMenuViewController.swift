//
//  MainSlideMenuViewController.swift
//  DemoAppBeenLoveMemoryLite
//
//  Created by dohien on 28/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import UIKit

class MainSlideMenuViewController: UIViewController , DatePickerViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    
    
    
    
    
    
    
    fileprivate var timer: Timer?
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
    @IBOutlet weak var imageNam: UIImageView!
    @IBOutlet weak var photoImageGirl: DesignableUI!
    
    @IBOutlet weak var btnTapgetNameA: UIButton!
    @IBOutlet weak var btnTapgetNameB: UIButton!
    
    var tapget: Bool = true
    //    var datePicker: UIDatePicker = UIDatePicker()
    //    let toolBar = UIToolbar()
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserDefaults()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func getUserDefaults() {
        if let name = UserDefaults.standard.string(forKey: "name"), let nu = UserDefaults.standard.string(forKey: "nu"),let datePicker = UserDefaults.standard.string(forKey: "datePicker"),  let loveData  = UserDefaults.standard.string(forKey: "loveData"), let year = UserDefaults.standard.string(forKey: "year"), let month = UserDefaults.standard.string(forKey: "month"), let week = UserDefaults.standard.string(forKey: "week"), let day = UserDefaults.standard.string(forKey: "day"), let hour = UserDefaults.standard.string(forKey: "hour"), let minute = UserDefaults.standard.string(forKey: "minute"), let second = UserDefaults.standard.string(forKey: "second")  {
            nameTextField.text = name
            nameGirlTextField.text = nu
            dateLabel.text = datePicker + "Days"
            loveDataLabel.text = loveData
            yearDataLabel.text = year
            monthDataLabel.text = month
            weekDataLabel.text = week
            dayDataLabel.text = day
            hourDataLabel.text = hour
            minuteDataLabel.text = minute
            secondDataLabel.text = second
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func menuBtn(_ sender: UIButton) {
        var alertController: UIAlertController?
        alertController = UIAlertController(title: "Enter Text", message: "Enter some text below", preferredStyle: .alert)
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
    }
    
    
    @IBAction func menuBtnGirlName(_ sender: UIButton) {
        var alertController: UIAlertController?
        alertController = UIAlertController(title: "Enter Text", message: "Enter some text below", preferredStyle: .alert)
        alertController?.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Enter something"
        })
        let action = UIAlertAction(title: "Change name", style: UIAlertActionStyle.default, handler: {[weak self]
            (paramAction: UIAlertAction!) in
            if let textFields = alertController?.textFields {
                let enteredText = textFields[0].text
                self?.nameGirlTextField.text = enteredText
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
    }
}
