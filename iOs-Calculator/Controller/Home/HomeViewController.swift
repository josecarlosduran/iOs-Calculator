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
    
    private var total: Double = 0
    private var temp: Double = 0
    private var operating = false
    private var decimal = false
    private var operation : OperationTypes = .none
    
    private enum OperationTypes {
        case none, addition, substraction, multiplication, division, percent
    }
    
    private let decimalSeparator = Locale.current.decimalSeparator!
    private let maxLength = 9
    private let maxValue : Double = 999999999
    private let minValue : Double = 0.00000001
    
    private let auxFormatter: NumberFormatter = {
           let formatter = NumberFormatter()
           let locale = Locale.current
           formatter.groupingSeparator = ""
           formatter.decimalSeparator = locale.decimalSeparator
           formatter.numberStyle = .decimal
           formatter.maximumIntegerDigits = 100
           formatter.minimumFractionDigits = 0
           formatter.maximumFractionDigits = 100
           return formatter
       }()
       
       
       private let auxTotalFormatter: NumberFormatter = {
           let formatter = NumberFormatter()
           formatter.groupingSeparator = ""
           formatter.decimalSeparator = ""
           formatter.numberStyle = .decimal
           formatter.maximumIntegerDigits = 100
           formatter.minimumFractionDigits = 0
           formatter.maximumFractionDigits = 100
           return formatter
       }()
    
        private let printFormatter: NumberFormatter = {
               let formatter = NumberFormatter()
               let locale = Locale.current
               formatter.groupingSeparator = locale.groupingSeparator
               formatter.decimalSeparator = locale.decimalSeparator
               formatter.numberStyle = .decimal
               formatter.maximumIntegerDigits = 9
               formatter.minimumFractionDigits = 0
               formatter.maximumFractionDigits = 8
               return formatter
           }()
    
        private let printScientificFormatter: NumberFormatter = {
               let formatter = NumberFormatter()
               formatter.numberStyle = .scientific
               formatter.maximumFractionDigits = 3
               formatter.exponentSymbol = "e"
               return formatter
           }()
    
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
        changeTextOfDecimalButtonAccordingLocale()
        
        calculateResult()
       
        

        
    }
    
    // MARK: - Button Actions

    @IBAction func operatorACAction(_ sender: UIButton) {
        clearValues()
        sender.shineAnimation()
    }
    
    
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        temp = temp * (-1)
        result.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shineAnimation()
       }
    
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        if operation != .percent{
            calculateResult()
        }
        operating = true
        operation = .percent
        calculateResult()
        sender.shineAnimation()
       }
    
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
       if operation != .none {
            calculateResult()
        }
        operating = true
        operation = .division
        sender.shineAnimation()
        }
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        if operation != .none {
            calculateResult()
        }
        operating = true
        operation = .multiplication
        sender.shineAnimation()
       }
    
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        if operation != .none {
            calculateResult()
        }
        operating = true
        operation = .substraction
        sender.shineAnimation()
       }
    
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        if operation != .none {
            calculateResult()
        }
        operating = true
        operation = .addition
        sender.shineAnimation()
       }
    
    @IBAction func operatorResultAction(_ sender: UIButton) {
        calculateResult()
        sender.shineAnimation()
       }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        let currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
       
        if result.text?.contains(decimalSeparator) ?? false ||
            (!operating && currentTemp.count >= maxLength){
            return
        }
        
        result.text = result.text! + decimalSeparator
        decimal = true
        sender.shineAnimation()
    }
    
    
    
    @IBAction func numberAction(_ sender: UIButton) {
        operatorAC.setTitle("C", for: .normal)
        var currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= maxLength{
            return
        }
        
        if operating {
            total = total == 0 ? temp : total
            result.text = ""
            currentTemp = ""
            operating = false
        }
        
        
        if decimal {
            currentTemp = "\(currentTemp)\(decimalSeparator)"
            decimal = false
        }
        
        let number = sender.tag
        

        temp = Double(currentTemp + String(number))!
        result.text = printFormatter.string(from: NSNumber(value: temp))
        
        sender.shineAnimation()
        
        
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
    
    private func changeTextOfDecimalButtonAccordingLocale(){
        
         numberDecimal.setTitle(decimalSeparator, for: .normal)
        
    }
    
    private func clearValues() {
        operation = .none
        operatorAC.setTitle("AC", for: .normal)
        if temp != 0 {
            temp = 0
            result.text = "0"
        }
        else{
            total = 0
            calculateResult()
        }
    }
    
    private func calculateResult(){
        switch operation{
            
        case .none:
            
            break
        case .addition:
            total = total + temp
            break
        case .substraction:
            total = total - temp
            break
        case .multiplication:
            total = total * temp
            break
        case .division:
            total = total / temp
            break
        case .percent:
            temp = temp / 100
            total = temp
            break
        }
        
        
        if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count > maxLength {
            result.text = printScientificFormatter.string(from: NSNumber(value: total))
        } else {
            result.text = printFormatter.string(from: NSNumber(value: total))
        }
        
        
        operation = .none
    }

}
