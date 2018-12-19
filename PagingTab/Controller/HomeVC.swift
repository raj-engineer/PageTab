//
//  HomeVC.swift
//  PagingDemo
//
//  Created by Rajesh on 17/12/18.
//  Copyright © 2018 Rajesh. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    //MARK:- IBOutlet Properties
    @IBOutlet weak var scrollViewHeader: UIScrollView!
    @IBOutlet weak var buttonFourth: UIButton!
    @IBOutlet weak var buttonThird: UIButton!
    @IBOutlet weak var buttonSecond: UIButton!
    @IBOutlet weak var buttonFirst: UIButton!
    
    //MARK:-  Properties
   
    let selectedColor =  Helper.sharedHelper.hexStringToUIColor(hex: "#47598E")  
    let unSelectedColor =   Helper.sharedHelper.hexStringToUIColor(hex: "#AAAAAA")
    var frame : CGRect?
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        frame =  buttonFirst.frame
        
        // Do any additional setup after loading the view.
    }
    
    //MARK:- IBAction
    @IBAction func actionFirst(_ sender: UIButton) {
        Helper.sharedHelper.pageControllerInstance?.setControllers(value: 0)
      setTabUI(index: 0)
       
    }
    
    @IBAction func actionSecond(_ sender: UIButton) {
         Helper.sharedHelper.pageControllerInstance?.setControllers(value: 1)
        
        setTabUI(index: 1)
    }
    @IBAction func actionThird(_ sender: UIButton) {
         Helper.sharedHelper.pageControllerInstance?.setControllers(value: 2)
        setTabUI(index: 2)
    }
    @IBAction func actionFourth(_ sender: UIButton) {
        Helper.sharedHelper.pageControllerInstance?.setControllers(value: 3)
        setTabUI(index: 3)
    }
    //MARK: - Custom Action
    func setTabUI(index : Int){
        var frame = buttonFirst.frame
        switch index {
        case 0:
            buttonFirst.setTitleColor(selectedColor, for: .normal)
            buttonSecond.setTitleColor(unSelectedColor, for: .normal)
            buttonThird.setTitleColor(unSelectedColor, for: .normal)
            buttonFourth.setTitleColor(unSelectedColor, for: .normal)
              frame  =  buttonFirst.frame
      case 1:
        buttonFirst.setTitleColor(unSelectedColor, for: .normal)
        buttonSecond.setTitleColor(selectedColor, for: .normal)
        buttonThird.setTitleColor(unSelectedColor, for: .normal)
        buttonFourth.setTitleColor(unSelectedColor, for: .normal)
              frame =  buttonSecond.frame
      case 2:
            buttonSecond.setTitleColor(unSelectedColor, for: .normal)
            buttonFirst.setTitleColor(unSelectedColor, for: .normal)
            buttonThird.setTitleColor(selectedColor, for: .normal)
            buttonFourth.setTitleColor(unSelectedColor, for: .normal)
             frame  =  buttonThird.frame
        case 3:
            buttonFirst.setTitleColor(unSelectedColor, for: .normal)
            buttonSecond.setTitleColor(unSelectedColor, for: .normal)
            buttonThird.setTitleColor(unSelectedColor, for: .normal)
            buttonFourth.setTitleColor(selectedColor, for: .normal)
            frame  =  buttonFourth.frame
        default:
            print("Default")
        }
             scrollViewHeader.scrollRectToVisible(frame, animated: true)
    }
    func home(){
        print("Home")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
