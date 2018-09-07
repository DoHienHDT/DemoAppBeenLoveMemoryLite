//
//  MainSlideMenuViewController.swift
//  DemoAppBeenLoveMemoryLite
//
//  Created by dohien on 28/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import UIKit

class MainSlideMenuViewController: UIViewController , DatePickerViewControllerDelegate{
    
    fileprivate var timer: Timer?
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var nameGirlTextField: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
//    var datePicker: UIDatePicker = UIDatePicker()
//    let toolBar = UIToolbar()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = UserDefaults.standard.string(forKey: "name") {
            nameTextField.text = name
        }
        if let nu = UserDefaults.standard.string(forKey: "nu") {
            nameGirlTextField.text = nu
        }
        if let datePicker = UserDefaults.standard.string(forKey: "datePicker") {
            dateLabel.text = datePicker + "Days"
        }
        // Do any additional setup after loading the view, typically from a nib.
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
    @IBAction func leftMenu() {
        NotificationCenter.default.post(name: NotificationKey.menuClick, object: nil)
    }
}
struct NotificationKey {
    static let menuClick = NSNotification.Name.init("menuClick")
}
