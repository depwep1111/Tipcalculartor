//
//  ViewController.swift
//  CaulatorTip
//
//  Created by tran trung thanh on 5/29/17.
//  Copyright © 2017 tran trung thanh. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet var txtMoney: UITextField!{
        didSet{
            txtMoney.keyboardType = UIKeyboardType.numberPad
        }
    }
    
    @IBOutlet var txtTeSult: UITextField!
    
    @IBOutlet var txtTipAmount: UITextField!{
        didSet{
            txtTipAmount.keyboardType = UIKeyboardType.numberPad
        }
    }
    
    var tip = "0";
    
    var money: Double!
    var tipAmount: Double!
    var reSult: Double!
    override func viewDidLoad() {
        super.viewDidLoad()
        observeKeyboard();
        if(tip != "0")
        {
            txtTipAmount.text = tip;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnCalculate(_ sender: Any) {
        userTapOnScreen(sender);
        if txtMoney.text!.isEmpty || txtTipAmount.text!.isEmpty {
            let alert = UIAlertController(title: "fail", message: "Please, enter all of information", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            money = Double(txtMoney.text!);
            tipAmount = Double(txtTipAmount.text!);
            reSult = (money*tipAmount)/100;
            txtTeSult.text = String(reSult);
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            

            let newHistory = NSEntityDescription.insertNewObject(forEntityName: "History", into: context) as NSManagedObject
            newHistory.setValue(txtMoney.text, forKey: "money")
            newHistory.setValue(txtTipAmount.text, forKey: "tipAmount")
            newHistory.setValue(txtTeSult.text, forKey: "reSult")
            
            do {
                try context.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }

        }
    }
    // return keyboard
    @IBAction func userTapOnScreen(_ sender: Any) {
        txtMoney.resignFirstResponder();
        txtTipAmount.resignFirstResponder();
    }
    fileprivate func observeKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: self.view.window);
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: self.view.window);
    }
    func keyboardWillShow(sender: NSNotification) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: -80, width: self.view.frame.width ,height: self.view.frame.height)
        }, completion: nil)
    }
    func keyboardWillHide(sender: NSNotification) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    
}

