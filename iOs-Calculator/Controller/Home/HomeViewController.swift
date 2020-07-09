//
//  HomeViewController.swift
//  iOs-Calculator
//
//  Created by Jose Carlos Duran on 09/07/2020.
//  Copyright © 2020 Jose Carlos Duran. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var numberDecimal: UIButton!
    
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorPlusMinus: UIButton!
    @IBOutlet weak var operatorPercent: UIButton!
    @IBOutlet weak var operatorResult: UIButton!
    @IBOutlet weak var operatorAddition: UIButton!
    @IBOutlet weak var operatorSubstraction: UIButton!
    @IBOutlet weak var operatorMultiplication: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    
    // MARK: - Initialization
    init (){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundAllButtons()
        

        
    }
    
    // MARK: - Button Actions

    @IBAction func operatorACAction(_ sender: UIButton) {
        sender.shineAnimation()
    }
    
    
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
         sender.shineAnimation()
       }
    
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        sender.shineAnimation()
       }
    
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        sender.shineAnimation()
        }
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        sender.shineAnimation()
       }
    
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        sender.shineAnimation()
       }
    
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        sender.shineAnimation()
       }
    
    @IBAction func operatorResultAction(_ sender: UIButton) {
        sender.shineAnimation()
       }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        sender.shineAnimation()
    }
    
    
    
    @IBAction func numberAction(_ sender: UIButton) {
        sender.shineAnimation()
        let number = sender.tag
        print(number)
    }
    
    
    
    // MARK : - Private methods
    
    private func roundAllButtons() {
        number0.roundBorder()
        number1.roundBorder()
        number2.roundBorder()
        number3.roundBorder()
        number4.roundBorder()
        number5.roundBorder()
        number6.roundBorder()
        number7.roundBorder()
        number8.roundBorder()
        number9.roundBorder()
        numberDecimal.roundBorder()
        
        operatorAC.roundBorder()
        operatorPlusMinus.roundBorder()
        operatorPercent.roundBorder()
        operatorResult.roundBorder()
        operatorAddition.roundBorder()
        operatorSubstraction.roundBorder()
        operatorMultiplication.roundBorder()
        operatorDivision.roundBorder()

        
    }
    
    

}
