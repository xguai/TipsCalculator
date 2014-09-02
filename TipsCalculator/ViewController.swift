//
//  ViewController.swift
//  TipsCalculator
//
//  Created by Xi Jin on 8/30/14.
//  Copyright (c) 2014 Xi Jin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitControl: UISegmentedControl!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var tipRateLabel: UILabel!
    @IBOutlet weak var totalPerPersonLabel1: UILabel!
    @IBOutlet weak var totalLabel1: UILabel!
    @IBOutlet weak var tipLabel1: UILabel!
    @IBOutlet weak var seperatorView: UIView!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hideViews()
    {
        self.view.backgroundColor =
            UIColor(patternImage: UIImage(named: "background.png"))
            
        self.tipRateLabel.alpha = 0
        self.tipControl.alpha = 0
        self.splitLabel.alpha = 0
        self.splitControl.alpha = 0
        self.seperatorView.alpha = 0
        self.tipLabel1.alpha = 0
        self.totalLabel1.alpha = 0
        self.totalPerPersonLabel1.alpha = 0
        self.tipLabel.alpha = 0
        self.totalLabel.alpha = 0
        self.totalPerPersonLabel.alpha = 0
        
        billLabel.frame = CGRect(origin: CGPoint(x:billLabel.frame.origin.x, y:261), size: billLabel.frame.size)
        billField.frame = CGRect(origin: CGPoint(x:billField.frame.origin.x, y:261), size: billField.frame.size)
        tipRateLabel.frame = CGRect(origin: CGPoint(x:tipRateLabel.frame.origin.x, y:290), size: tipRateLabel.frame.size)
        tipControl.frame = CGRect(origin: CGPoint(x:tipControl.frame.origin.x, y:320), size: tipControl.frame.size)
        splitLabel.frame = CGRect(origin: CGPoint(x:splitLabel.frame.origin.x, y:350), size: splitLabel.frame.size)
        splitControl.frame = CGRect(origin: CGPoint(x:splitControl.frame.origin.x, y:380), size: splitControl.frame.size)
        seperatorView.frame = CGRect(origin: CGPoint(x:seperatorView.frame.origin.x, y:410), size: seperatorView.frame.size)
        tipLabel1.frame = CGRect(origin: CGPoint (x:tipLabel1.frame.origin.x, y:440), size: tipLabel1.frame.size)
        totalLabel1.frame = CGRect(origin: CGPoint(x:totalLabel1.frame.origin.x, y:470), size: totalLabel1.frame.size)
        totalPerPersonLabel1.frame = CGRect(origin: CGPoint(x:totalPerPersonLabel1.frame.origin.x, y:500), size: totalPerPersonLabel1.frame.size)
        tipLabel.frame = CGRect(origin: CGPoint(x:  tipLabel.frame.origin.x, y:440),  size: tipLabel.frame.size)
        totalLabel.frame = CGRect(origin: CGPoint(x:totalLabel.frame.origin.x, y:470), size: totalLabel.frame.size)
        totalPerPersonLabel.frame = CGRect(origin:CGPoint(x:totalPerPersonLabel.frame.origin.x, y:500), size: totalPerPersonLabel.frame.size)
    }
    
    func displayViews ()
    {
        self.view.backgroundColor =
            UIColor(patternImage: UIImage(named: "background.png"))
        
        self.tipRateLabel.alpha = 1
        self.tipControl.alpha = 1
        self.splitLabel.alpha = 1
        self.splitControl.alpha = 1
        self.seperatorView.alpha = 1
        self.tipLabel1.alpha = 1
        self.totalLabel1.alpha = 1
        self.totalPerPersonLabel1.alpha = 1
        self.tipLabel.alpha = 1
        self.totalLabel.alpha = 1
        self.totalPerPersonLabel.alpha = 1
        
        billLabel.frame = CGRect(origin: CGPoint(x:billLabel.frame.origin.x, y:104), size: billLabel.frame.size)
        billField.frame = CGRect(origin: CGPoint(x:billField.frame.origin.x, y:104), size: billField.frame.size)
        tipRateLabel.frame = CGRect(origin: CGPoint(x:tipRateLabel.frame.origin.x, y:142), size: tipRateLabel.frame.size)
        tipControl.frame = CGRect(origin: CGPoint(x:tipControl.frame.origin.x, y:167), size: tipControl.frame.size)
        splitLabel.frame = CGRect(origin: CGPoint(x:splitLabel.frame.origin.x, y:209), size: splitLabel.frame.size)
        splitControl.frame = CGRect(origin: CGPoint(x:splitControl.frame.origin.x, y:234), size: splitControl.frame.size)
        seperatorView.frame = CGRect(origin: CGPoint(x:seperatorView.frame.origin.x, y:290), size: seperatorView.frame.size)
        tipLabel1.frame = CGRect(origin: CGPoint (x:tipLabel1.frame.origin.x, y:315), size: tipLabel1.frame.size)
        totalLabel1.frame = CGRect(origin: CGPoint(x:totalLabel1.frame.origin.x, y:342), size: totalLabel1.frame.size)
        totalPerPersonLabel1.frame = CGRect(origin: CGPoint(x:totalPerPersonLabel1.frame.origin.x, y:375), size: totalPerPersonLabel1.frame.size)
        tipLabel.frame = CGRect(origin: CGPoint(x:  tipLabel.frame.origin.x, y:315),  size: tipLabel.frame.size)
        totalLabel.frame = CGRect(origin: CGPoint(x:totalLabel.frame.origin.x, y:342), size: totalLabel.frame.size)
        totalPerPersonLabel.frame = CGRect(origin:CGPoint(x:totalPerPersonLabel.frame.origin.x, y:375), size: totalPerPersonLabel.frame.size)
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.15, 0.2, 0.3]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var splitNumbers = [1, 2, 3, 4]
        var splitNumber = splitNumbers[splitControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var totalPerPerson = total / Double(splitNumber)

        if (billAmount == 0)
        {
            UIView.animateWithDuration(0.5, animations:{
                self.hideViews()
            })
        }
        else
        {
            UIView.animateWithDuration(0.5, animations:{
                self.displayViews()
            })
        }
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalPerPersonLabel.text = String(format: "$%.2f", totalPerPerson)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

