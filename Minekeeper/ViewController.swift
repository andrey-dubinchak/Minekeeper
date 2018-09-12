//
//  ViewController.swift
//  Minekeeper
//
//  Created by Andrey Dubinchak on 05.09.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewArray = Array(repeating: Array(repeating: 0, count: 10), count: 10)
    var model: Model!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newGame(action: nil)

    }

    @IBAction func buttonClick(_ sender: UIButton) {

        if sender.titleLabel?.font.pointSize ==  CGFloat(16.0) && (sender.backgroundColor == #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) || sender.backgroundColor == nil) {
            sender.backgroundColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
            sender.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            updateArray(tag: sender.tag, set: true)
        } else if sender.backgroundColor == #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1) {
            sender.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            sender.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
            sender.titleLabel?.font =  .systemFont(ofSize: 10)
            updateArray(tag: sender.tag, set: false)
        } else {
            sender.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            sender.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            sender.titleLabel?.font =  UIFont(name: ".SFUIText-Bold", size: 16)
        }
        for raw in viewArray {
            print(raw)
            print("my")
        }
        compareArrays()
    }
    
    func updateArray(tag: Int, set: Bool) {
        if set {
            viewArray[tag/10][tag%10] = 1
        } else {
            viewArray[tag/10][tag%10] = 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func compareArrays(){
        let ok = model.array == viewArray
        print(ok)
        if ok {
            let ac = UIAlertController(title: title, message: "You win!", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default,
                handler: newGame))
                present(ac, animated: true)
        }
    }
    
    func newGame(action: UIAlertAction!) {
        model = Model()
        for raw in model.array {
            print(raw)
            print("1")
        }
        for i in 1...8 {
            for j in 1...8 {
                let count = model.array[i-1][j] + model.array[i][j-1] + model.array[i+1][j] + model.array[i][j+1]
                let button = view.viewWithTag(i*10+j) as? UIButton
                button?.setTitle(String(count), for: .normal)
                button?.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                button?.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
                button?.titleLabel?.font =  UIFont(name: ".SFUIText-Bold", size: 16)
            }
        }
    }
}

