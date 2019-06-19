//
//  ViewController.swift
//  TicTacToe
//
//  Created by Tushar Garg on 18/06/19.
//  Copyright © 2019 Tushar Garg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!

    @IBOutlet weak var myBox: UIView!
    @IBOutlet weak var winBox: UILabel!
    
    var tracker:Bool = true
    var count:Int = 0
    var arr_o:[Bool] = [false,false,false,false,false,false,false,false,false,false]
    var arr_x:[Bool] = [false,false,false,false,false,false,false,false,false,false]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winBox.layer.borderWidth = 4
        winBox.layer.cornerRadius = 30
        winBox.layer.shadowRadius = 3
        
        setButton(btn: button1)
        setButton(btn: button2)
        setButton(btn: button3)
        setButton(btn: button4)
        setButton(btn: button5)
        setButton(btn: button6)
        setButton(btn: button7)
        setButton(btn: button8)
        setButton(btn: button9)
    }
    
    func setButton(btn:UIButton){
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
    }

    func checkBoardFor(arr:[Bool])  -> Bool{
        
        if ( arr[1]&&arr[2]&&arr[3]) || ( arr[4]&&arr[5]&&arr[6]) || ( arr[7]&&arr[8]&&arr[9]) || ( arr[1]&&arr[4]&&arr[7]) || ( arr[2]&&arr[5]&&arr[8])||( arr[3]&&arr[6]&&arr[9]) {
            return true
        }
        
        if ( arr[1]&&arr[5]&&arr[9]) || ( arr[3]&&arr[5]&&arr[7]){
            return true
        }
        
        return false
    }

    @IBAction func resetBoard(_ sender: UIButton) {
        
        for i in 0..<arr_o.count{
            arr_o[i] = false
        }
        
        for i in 0..<arr_x.count{
            arr_x[i] = false
        }
        
        button1.setImage(nil, for: .normal)
        button2.setImage(nil, for: .normal)
        button3.setImage(nil, for: .normal)
        button4.setImage(nil, for: .normal)
        button5.setImage(nil, for: .normal)
        button6.setImage(nil, for: .normal)
        button7.setImage(nil, for: .normal)
        button8.setImage(nil, for: .normal)
        button9.setImage(nil, for: .normal)
        
        myBox.isHidden = true
       winBox.isHidden = true
        
        count = 0
    }
    @IBAction func fillBoard(_ sender: UIButton) {
        if sender.currentImage  ==   nil {
            count  += 1
            
            if(tracker){
                
                tracker = false
                sender.setImage( UIImage(named: "o"), for: .normal)
                
                let st = sender.accessibilityAttributedLabel!.string
                arr_o[Int(st)!] = true
                
                if checkBoardFor(arr: arr_o){
                    myBox.isHidden = false
                    winBox.isHidden = false
                    winBox.text = "O wins!"
                }
            }else{
                
                tracker = true
                sender.setImage( UIImage(named: "x"), for: .normal)
                
                let st = sender.accessibilityAttributedLabel!.string
                arr_x[Int(st)!] = true
                
                if checkBoardFor(arr: arr_x){
                    myBox.isHidden = false
                    winBox.isHidden = false
                    winBox.text = "X wins!"
                }
            }
        
        }
        
        if count == 9{
            myBox.isHidden = false
            winBox.isHidden = false
            winBox.text = "Tie!"
        }
    }
}

