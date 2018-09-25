//
//  MainViewController.swift
//  BaseConverter
//
//  Created by Satish Boggarapu on 9/16/18.
//  Copyright © 2018 SatishBoggarapu. All rights reserved.
//

import UIKit
import PinLayout
import MaterialComponents

class MainViewController: UIViewController {

    //MARK: UIElements

    // base buttons
    private var decimalButton: MDCButton!
    private var binaryButton: MDCButton!
    private var hexButton: MDCButton!
    private var octButton: MDCButton!
    // base labels
    private var decimalLabel: UILabel!
    private var binaryLabel: UILabel!
    private var hexLabel: UILabel!
    private var octLabel: UILabel!
    // hex letters
    private var aDigitButton: MDCButton!
    private var bDigitButton: MDCButton!
    private var cDigitButton: MDCButton!
    private var dDigitButton: MDCButton!
    private var eDigitButton: MDCButton!
    private var fDigitButton: MDCButton!
    // 0-9 digits
    private var zeroDigitButton: MDCButton!
    private var oneDigitButton: MDCButton!
    private var twoDigitButton: MDCButton!
    private var threeDigitButton: MDCButton!
    private var fourDigitButton: MDCButton!
    private var fiveDigitButton: MDCButton!
    private var sixDigitButton: MDCButton!
    private var sevenDigitButton: MDCButton!
    private var eightDigitButton: MDCButton!
    private var nineDigitButton: MDCButton!
//    private var periodDigitButton: MDCButton!
    // operators and others
    private var delButton: MDCButton!
    private var acButton: MDCButton!
//    private var multiplyButton: MDCButton!
//    private var divideButton: MDCButton!
//    private var addButton: MDCButton!
//    private var subtractButton: MDCButton!
//    private var equalsButton: MDCButton!

    //MARK: Attributes

    var activeBase: Int = 0
    var firstNumber: String = ""
    var secondNumber: String = ""
    var operation: Int = 0

    let textColor: UIColor = .white
    let baseButtonBackgroundColor: UIColor = UIColor(hex: 0x22c750) //UIColor(hex: 0x152521)
    let backgroundColor: UIColor = UIColor(hex: 0x343434) //UIColor(hex: 0x01cc99)//0x152521)
    let buttonDisabledColor: UIColor = UIColor(hex: 0x818181)
    let font: UIFont = UIFont(name: "Avenir-Black", size: 18)!


    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()

        toggleBaseButtons()
        toggleDigitButtons()

        let num = "1.1"
        print(num.binaryToDecimal)

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let rowHeight: CGFloat = (view.frame.height - Helper.getStatusBarHeight() - 16) / 9.0
        let sixButtonRowWidth: CGFloat = (view.frame.width - 10) / 6.0
        let fiveButtonRowWidth: CGFloat = (view.frame.width - 8) / 5.0
        let zeroButtonWidth: CGFloat = fiveButtonRowWidth * 3 + 2

        // base buttons
        decimalButton.pin.left(to: view.edge.left).top(to: view.edge.top).marginTop(Helper.getStatusBarHeight()).width(rowHeight).height(rowHeight).marginBottom(1)
        binaryButton.pin.left(to: view.edge.left).top(to: decimalButton.edge.bottom).width(rowHeight).height(rowHeight).marginTop(1).marginBottom(1)
        hexButton.pin.left(to: view.edge.left).top(to: binaryButton.edge.bottom).width(rowHeight).height(rowHeight).marginTop(1).marginBottom(1)
        octButton.pin.left(to: view.edge.left).top(to: hexButton.edge.bottom).width(rowHeight).height(rowHeight).marginTop(1).marginBottom(1)
        // base labels
        decimalLabel.pin.left(to: decimalButton.edge.right).right(to: view.edge.right).top(to: view.edge.top).height(rowHeight).marginRight(4).marginTop(Helper.getStatusBarHeight())
        binaryLabel.pin.left(to: binaryButton.edge.right).right(to: view.edge.right).top(to: decimalLabel.edge.bottom).height(rowHeight).marginRight(4)
        hexLabel.pin.left(to: hexButton.edge.right).right(to: view.edge.right).top(to: binaryLabel.edge.bottom).height(rowHeight).marginRight(4)
        octLabel.pin.left(to: octButton.edge.right).right(to: view.edge.right).top(to: hexLabel.edge.bottom).height(rowHeight).marginRight(4)
        // 0-9 digits , .
        sevenDigitButton.pin.left(to: view.edge.left).top(to: octButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight).marginTop(1).marginBottom(1).marginRight(1)
        eightDigitButton.pin.left(to: sevenDigitButton.edge.right).top(to: octButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight).marginTop(1).marginBottom(1).marginLeft(1).marginRight(1)
        nineDigitButton.pin.left(to: eightDigitButton.edge.right).top(to: octButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight).marginTop(1).marginBottom(1).marginLeft(1).marginRight(1)
        fourDigitButton.pin.left(to: view.edge.left).top(to: sevenDigitButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight).marginTop(1).marginBottom(1).marginRight(1)
        fiveDigitButton.pin.left(to: fourDigitButton.edge.right).top(to: eightDigitButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight).marginTop(1).marginBottom(1).marginLeft(1).marginRight(1)
        sixDigitButton.pin.left(to: fiveDigitButton.edge.right).top(to: nineDigitButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight).marginTop(1).marginBottom(1).marginLeft(1).marginRight(1)
        oneDigitButton.pin.left(to: view.edge.left).top(to: fourDigitButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight).marginTop(1).marginBottom(1).marginRight(1)
        twoDigitButton.pin.left(to: oneDigitButton.edge.right).top(to: fiveDigitButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight).marginTop(1).marginBottom(1).marginLeft(1).marginRight(1)
        threeDigitButton.pin.left(to: twoDigitButton.edge.right).top(to: sixDigitButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight).marginTop(1).marginBottom(1).marginLeft(1).marginRight(1)
        zeroDigitButton.pin.left(to: view.edge.left).top(to: oneDigitButton.edge.bottom).bottom(to: view.edge.bottom).width(zeroButtonWidth).marginTop(1).marginRight(1)
//        periodDigitButton.pin.left(to: zeroDigitButton.edge.right).top(to: threeDigitButton.edge.bottom).bottom(to: view.edge.bottom).width(fiveButtonRowWidth).marginTop(1).marginLeft(1).marginRight(1)
        // other buttons
        delButton.pin.left(to: nineDigitButton.edge.right).top(to: octButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight).marginTop(1).marginBottom(1).marginLeft(1).marginRight(1)
        acButton.pin.left(to: delButton.edge.right).right(to: view.edge.right).top(to: octButton.edge.bottom).height(rowHeight).marginTop(1).marginBottom(1).marginLeft(1)
//        multiplyButton.pin.left(to: sixDigitButton.edge.right).top(to: delButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight).marginTop(1).marginBottom(1).marginLeft(1).marginRight(1)
//        divideButton.pin.left(to: multiplyButton.edge.right).right(to: view.edge.right).top(to: acButton.edge.bottom).height(rowHeight).marginTop(1).marginBottom(1).marginLeft(1)
//        addButton.pin.left(to: threeDigitButton.edge.right).top(to: multiplyButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight).marginTop(1).marginBottom(1).marginLeft(1).marginRight(1)
//        subtractButton.pin.left(to: addButton.edge.right).right(to: view.edge.right).top(to: divideButton.edge.bottom).height(rowHeight).marginTop(1).marginBottom(1).marginLeft(1)
//        equalsButton.pin.left(to: periodDigitButton.edge.right).right(to: view.edge.right).top(to: threeDigitButton.edge.bottom).bottom(to: view.edge.bottom).marginTop(1).marginLeft(1)
        // hex letters
        aDigitButton.pin.left(to: sixDigitButton.edge.right).top(to: delButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight).marginTop(1).marginBottom(1).marginRight(1).marginLeft(1)
        bDigitButton.pin.left(to: aDigitButton.edge.right).right(to: view.edge.right).top(to: acButton.edge.bottom).height(rowHeight).marginTop(1).marginBottom(1).marginLeft(1)
        cDigitButton.pin.left(to: threeDigitButton.edge.right).top(to: aDigitButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight).marginTop(1).marginBottom(1).marginLeft(1).marginRight(1)
        dDigitButton.pin.left(to: cDigitButton.edge.right).right(to: view.edge.right).top(to: bDigitButton.edge.bottom).height(rowHeight).marginTop(1).marginBottom(1).marginLeft(1)
        eDigitButton.pin.left(to: zeroDigitButton.edge.right).top(to: cDigitButton.edge.bottom).bottom(to: view.edge.bottom).width(fiveButtonRowWidth).marginTop(1).marginLeft(1).marginRight(1)
        fDigitButton.pin.left(to: eDigitButton.edge.right).right(to: view.edge.right).top(to: dDigitButton.edge.bottom).bottom(to: view.edge.bottom).marginTop(1).marginLeft(1)

    }

    // MARK: Initializer Functions

    private func setupView() {
        setupNavigationBar()
//        setupGradientBackground()
        setupBaseButtons()
        setupBaseLabels()
        setupHexLetterButtons()
        setupNormalDigitButtons()
        setupOtherButtons()

        view.backgroundColor = UIColor(hex: 0x161616)
    }

    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func setupGradientBackground() {
        let colorTop =  UIColor(hex: 0x1EAE9C).cgColor
        let colorBottom = UIColor(hex: 0x000021).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = view.frame
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    private func setupBaseButtons() {
        decimalButton = MDCButton()
        decimalButton.setTitle("DEC", for: .normal)
        decimalButton.setTitleColor(textColor, for: .normal)
        decimalButton.backgroundColor = backgroundColor
        decimalButton.setBackgroundColor(backgroundColor, for: .normal)
        decimalButton.setBackgroundColor(baseButtonBackgroundColor, for: .selected)
        decimalButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        decimalButton.titleLabel?.font = font
        decimalButton.tag = 0
        decimalButton.addTarget(self, action: #selector(baseButtonAction(_:)), for: .touchUpInside)
        view.addSubview(decimalButton)

        binaryButton = MDCButton()
        binaryButton.setTitle("BIN", for: .normal)
        binaryButton.setTitleColor(textColor, for: .normal)
        binaryButton.setBackgroundColor(backgroundColor, for: .normal)
        binaryButton.setBackgroundColor(baseButtonBackgroundColor, for: .selected)
        binaryButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        binaryButton.titleLabel?.font = font
        binaryButton.tag = 1
        binaryButton.addTarget(self, action: #selector(baseButtonAction(_:)), for: .touchUpInside)
        view.addSubview(binaryButton)

        hexButton = MDCButton()
        hexButton.setTitle("HEX", for: .normal)
        hexButton.setTitleColor(textColor, for: .normal)
        hexButton.setBackgroundColor(backgroundColor, for: .normal)
        hexButton.setBackgroundColor(baseButtonBackgroundColor, for: .selected)
        hexButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        hexButton.titleLabel?.font = font
        hexButton.tag = 2
        hexButton.addTarget(self, action: #selector(baseButtonAction(_:)), for: .touchUpInside)
        view.addSubview(hexButton)

        octButton = MDCButton()
        octButton.setTitle("OCT", for: .normal)
        octButton.setTitleColor(textColor, for: .normal)
        octButton.setBackgroundColor(backgroundColor, for: .normal)
        octButton.setBackgroundColor(baseButtonBackgroundColor, for: .selected)
        octButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        octButton.titleLabel?.font = font
        octButton.tag = 3
        octButton.addTarget(self, action: #selector(baseButtonAction(_:)), for: .touchUpInside)
        view.addSubview(octButton)
    }

    private func setupBaseLabels() {
        decimalLabel = UILabel()
        decimalLabel.textColor = textColor
        decimalLabel.text = "0"
        decimalLabel.textAlignment = .right
        decimalLabel.contentMode = .center
        decimalLabel.backgroundColor = UIColor(hex: 0x161616)
        view.addSubview(decimalLabel)

        binaryLabel = UILabel()
        binaryLabel.textColor = textColor
        binaryLabel.text = "0"
        binaryLabel.textAlignment = .right
        binaryLabel.contentMode = .center
        binaryLabel.backgroundColor = UIColor(hex: 0x161616)
        view.addSubview(binaryLabel)

        hexLabel = UILabel()
        hexLabel.textColor = textColor
        hexLabel.text = "0"
        hexLabel.textAlignment = .right
        hexLabel.contentMode = .center
        hexLabel.backgroundColor = UIColor(hex: 0x161616)
        view.addSubview(hexLabel)

        octLabel = UILabel()
        octLabel.textColor = textColor
        octLabel.text = "0"
        octLabel.textAlignment = .right
        octLabel.contentMode = .center
        octLabel.backgroundColor = UIColor(hex: 0x161616)
        view.addSubview(octLabel)
    }

    private func setupHexLetterButtons() {
        aDigitButton = MDCButton()
        aDigitButton.setTitle("A", for: .normal)
        aDigitButton.setTitleColor(textColor, for: .normal)
        aDigitButton.setBackgroundColor(backgroundColor, for: .normal)
        aDigitButton.setBackgroundColor(buttonDisabledColor, for: .disabled)
        aDigitButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        aDigitButton.titleLabel?.font = font
        aDigitButton.tag = 10
        aDigitButton.addTarget(self, action: #selector(digitButtonAction(_:)), for: .touchUpInside)
        aDigitButton.adjustsImageWhenDisabled = false
        view.addSubview(aDigitButton)

        bDigitButton = MDCButton()
        bDigitButton.setTitle("B", for: .normal)
        bDigitButton.setTitleColor(textColor, for: .normal)
        bDigitButton.setBackgroundColor(backgroundColor, for: .normal)
        bDigitButton.setBackgroundColor(buttonDisabledColor, for: .disabled)
        bDigitButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        bDigitButton.titleLabel?.font = font
        bDigitButton.tag = 11
        bDigitButton.addTarget(self, action: #selector(digitButtonAction(_:)), for: .touchUpInside)
        view.addSubview(bDigitButton)

        cDigitButton = MDCButton()
        cDigitButton.setTitle("C", for: .normal)
        cDigitButton.setTitleColor(textColor, for: .normal)
        cDigitButton.setBackgroundColor(backgroundColor, for: .normal)
        cDigitButton.setBackgroundColor(buttonDisabledColor, for: .disabled)
        cDigitButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        cDigitButton.titleLabel?.font = font
        cDigitButton.tag = 12
        cDigitButton.addTarget(self, action: #selector(digitButtonAction(_:)), for: .touchUpInside)
        view.addSubview(cDigitButton)

        dDigitButton = MDCButton()
        dDigitButton.setTitle("D", for: .normal)
        dDigitButton.setTitleColor(textColor, for: .normal)
        dDigitButton.setBackgroundColor(backgroundColor, for: .normal)
        dDigitButton.setBackgroundColor(buttonDisabledColor, for: .disabled)
        dDigitButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        dDigitButton.titleLabel?.font = font
        dDigitButton.tag = 13
        dDigitButton.addTarget(self, action: #selector(digitButtonAction(_:)), for: .touchUpInside)
        view.addSubview(dDigitButton)

        eDigitButton = MDCButton()
        eDigitButton.setTitle("E", for: .normal)
        eDigitButton.setTitleColor(textColor, for: .normal)
        eDigitButton.setBackgroundColor(backgroundColor, for: .normal)
        eDigitButton.setBackgroundColor(buttonDisabledColor, for: .disabled)
        eDigitButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        eDigitButton.titleLabel?.font = font
        eDigitButton.tag = 14
        eDigitButton.addTarget(self, action: #selector(digitButtonAction(_:)), for: .touchUpInside)
        view.addSubview(eDigitButton)

        fDigitButton = MDCButton()
        fDigitButton.setTitle("F", for: .normal)
        fDigitButton.setTitleColor(textColor, for: .normal)
        fDigitButton.setBackgroundColor(backgroundColor, for: .normal)
        fDigitButton.setBackgroundColor(buttonDisabledColor, for: .disabled)
        fDigitButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        fDigitButton.titleLabel?.font = font
        fDigitButton.tag = 15
        fDigitButton.addTarget(self, action: #selector(digitButtonAction(_:)), for: .touchUpInside)
        view.addSubview(fDigitButton)
    }

    private func setupNormalDigitButtons() {
        /*periodDigitButton = MDCButton()
        periodDigitButton.setTitle(".", for: .normal)
        periodDigitButton.setTitleColor(textColor, for: .normal)
        periodDigitButton.setBackgroundColor(backgroundColor, for: .normal)
        periodDigitButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        periodDigitButton.titleLabel?.font = font
        periodDigitButton.addTarget(self, action: #selector(periodDigitButtonAction), for: .touchUpInside)
        view.addSubview(periodDigitButton)*/

        zeroDigitButton = MDCButton()
        zeroDigitButton.setTitle("0", for: .normal)
        zeroDigitButton.setTitleColor(textColor, for: .normal)
        zeroDigitButton.setBackgroundColor(backgroundColor, for: .normal)
        zeroDigitButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        zeroDigitButton.titleLabel?.font = font
        zeroDigitButton.tag = 0
        zeroDigitButton.addTarget(self, action: #selector(digitButtonAction(_:)), for: .touchUpInside)
        view.addSubview(zeroDigitButton)

        oneDigitButton = MDCButton()
        oneDigitButton.setTitle("1", for: .normal)
        oneDigitButton.setTitleColor(textColor, for: .normal)
        oneDigitButton.setBackgroundColor(backgroundColor, for: .normal)
        oneDigitButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        oneDigitButton.titleLabel?.font = font
        oneDigitButton.tag = 1
        oneDigitButton.addTarget(self, action: #selector(digitButtonAction(_:)), for: .touchUpInside)
        view.addSubview(oneDigitButton)

        twoDigitButton = MDCButton()
        twoDigitButton.setTitle("2", for: .normal)
        twoDigitButton.setTitleColor(textColor, for: .normal)
        twoDigitButton.setBackgroundColor(backgroundColor, for: .normal)
        twoDigitButton.setBackgroundColor(buttonDisabledColor, for: .disabled)
        twoDigitButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        twoDigitButton.titleLabel?.font = font
        twoDigitButton.tag = 2
        twoDigitButton.addTarget(self, action: #selector(digitButtonAction(_:)), for: .touchUpInside)
        view.addSubview(twoDigitButton)

        threeDigitButton = MDCButton()
        threeDigitButton.setTitle("3", for: .normal)
        threeDigitButton.setTitleColor(textColor, for: .normal)
        threeDigitButton.setBackgroundColor(backgroundColor, for: .normal)
        threeDigitButton.setBackgroundColor(buttonDisabledColor, for: .disabled)
        threeDigitButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        threeDigitButton.titleLabel?.font = font
        threeDigitButton.tag = 3
        threeDigitButton.addTarget(self, action: #selector(digitButtonAction(_:)), for: .touchUpInside)
        view.addSubview(threeDigitButton)

        fourDigitButton = MDCButton()
        fourDigitButton.setTitle("4", for: .normal)
        fourDigitButton.setTitleColor(textColor, for: .normal)
        fourDigitButton.setBackgroundColor(backgroundColor, for: .normal)
        fourDigitButton.setBackgroundColor(buttonDisabledColor, for: .disabled)
        fourDigitButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        fourDigitButton.titleLabel?.font = font
        fourDigitButton.tag = 4
        fourDigitButton.addTarget(self, action: #selector(digitButtonAction(_:)), for: .touchUpInside)
        view.addSubview(fourDigitButton)

        fiveDigitButton = MDCButton()
        fiveDigitButton.setTitle("5", for: .normal)
        fiveDigitButton.setTitleColor(textColor, for: .normal)
        fiveDigitButton.setBackgroundColor(backgroundColor, for: .normal)
        fiveDigitButton.setBackgroundColor(buttonDisabledColor, for: .disabled)
        fiveDigitButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        fiveDigitButton.titleLabel?.font = font
        fiveDigitButton.tag = 5
        fiveDigitButton.addTarget(self, action: #selector(digitButtonAction(_:)), for: .touchUpInside)
        view.addSubview(fiveDigitButton)

        sixDigitButton = MDCButton()
        sixDigitButton.setTitle("6", for: .normal)
        sixDigitButton.setTitleColor(textColor, for: .normal)
        sixDigitButton.setBackgroundColor(backgroundColor, for: .normal)
        sixDigitButton.setBackgroundColor(buttonDisabledColor, for: .disabled)
        sixDigitButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        sixDigitButton.titleLabel?.font = font
        sixDigitButton.tag = 6
        sixDigitButton.addTarget(self, action: #selector(digitButtonAction(_:)), for: .touchUpInside)
        view.addSubview(sixDigitButton)

        sevenDigitButton = MDCButton()
        sevenDigitButton.setTitle("7", for: .normal)
        sevenDigitButton.setTitleColor(textColor, for: .normal)
        sevenDigitButton.setBackgroundColor(backgroundColor, for: .normal)
        sevenDigitButton.setBackgroundColor(buttonDisabledColor, for: .disabled)
        sevenDigitButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        sevenDigitButton.titleLabel?.font = font
        sevenDigitButton.tag = 7
        sevenDigitButton.addTarget(self, action: #selector(digitButtonAction(_:)), for: .touchUpInside)
        view.addSubview(sevenDigitButton)

        eightDigitButton = MDCButton()
        eightDigitButton.setTitle("8", for: .normal)
        eightDigitButton.setTitleColor(textColor, for: .normal)
        eightDigitButton.setBackgroundColor(backgroundColor, for: .normal)
        eightDigitButton.setBackgroundColor(buttonDisabledColor, for: .disabled)
        eightDigitButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        eightDigitButton.titleLabel?.font = font
        eightDigitButton.tag = 8
        eightDigitButton.addTarget(self, action: #selector(digitButtonAction(_:)), for: .touchUpInside)
        view.addSubview(eightDigitButton)

        nineDigitButton = MDCButton()
        nineDigitButton.setTitle("9", for: .normal)
        nineDigitButton.setTitleColor(textColor, for: .normal)
        nineDigitButton.setBackgroundColor(backgroundColor, for: .normal)
        nineDigitButton.setBackgroundColor(buttonDisabledColor, for: .disabled)
        nineDigitButton.setBackgroundColor(baseButtonBackgroundColor, for: .highlighted)
        nineDigitButton.titleLabel?.font = font
        nineDigitButton.tag = 9
        nineDigitButton.addTarget(self, action: #selector(digitButtonAction(_:)), for: .touchUpInside)
        view.addSubview(nineDigitButton)
    }

    private func setupOtherButtons() {
        /*addButton = MDCButton()
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(textColor, for: .normal)
        addButton.backgroundColor = UIColor(hex: 0x2872f4)
        addButton.titleLabel?.font = font
        addButton.tag = 1
        addButton.addTarget(self, action: #selector(operationButtonAction(_:)), for: .touchUpInside)
        view.addSubview(addButton)

        subtractButton = MDCButton()
        subtractButton.setTitle("-", for: .normal)
        subtractButton.setTitleColor(textColor, for: .normal)
        subtractButton.backgroundColor = UIColor(hex: 0x2872f4)
        subtractButton.titleLabel?.font = font
        subtractButton.tag = 2
        subtractButton.addTarget(self, action: #selector(operationButtonAction(_:)), for: .touchUpInside)
        view.addSubview(subtractButton)

        multiplyButton = MDCButton()
        multiplyButton.setTitle("x", for: .normal)
        multiplyButton.setTitleColor(textColor, for: .normal)
        multiplyButton.backgroundColor = UIColor(hex: 0x2872f4)
        multiplyButton.titleLabel?.font = font
        multiplyButton.tag = 3
        multiplyButton.addTarget(self, action: #selector(operationButtonAction(_:)), for: .touchUpInside)
        view.addSubview(multiplyButton)

        divideButton = MDCButton()
        divideButton.setTitle("/", for: .normal)
        divideButton.setTitleColor(textColor, for: .normal)
        divideButton.backgroundColor = UIColor(hex: 0x2872f4)
        divideButton.titleLabel?.font = font
        divideButton.tag = 4
        divideButton.addTarget(self, action: #selector(operationButtonAction(_:)), for: .touchUpInside)
        view.addSubview(divideButton)*/

        delButton = MDCButton()
        delButton.setTitle("DEL", for: .normal)
        delButton.setTitleColor(textColor, for: .normal)
        delButton.backgroundColor = UIColor(hex: 0xee382a)
        delButton.titleLabel?.font = font
        delButton.addTarget(self, action: #selector(delButtonAction), for: .touchUpInside)
        view.addSubview(delButton)

        acButton = MDCButton()
        acButton.setTitle("AC", for: .normal)
        acButton.setTitleColor(textColor, for: .normal)
        acButton.backgroundColor = UIColor(hex: 0xee382a)
        acButton.titleLabel?.font = font
        acButton.addTarget(self, action: #selector(acButtonAction), for: .touchUpInside)
        view.addSubview(acButton)

        /*equalsButton = MDCButton()
        equalsButton.setTitle("=", for: .normal)
        equalsButton.setTitleColor(textColor, for: .normal)
        equalsButton.backgroundColor = UIColor(hex: 0xee382a)
        equalsButton.titleLabel?.font = font
        equalsButton.addTarget(self, action: #selector(equalsButtonAction), for: .touchUpInside)
        view.addSubview(equalsButton)*/
    }

    @objc private func baseButtonAction(_ button: MDCButton) {
        /*
            0 - Decimal button - 0-9, .
            1 - Binary Button - 0, 1, .
            2 - Hex Button - all
            3 - Oct Button, 0-7, .
        */
        activeBase = button.tag
        toggleBaseButtons()
        toggleDigitButtons()
        resetEverything()
    }

    @objc private func digitButtonAction(_ button: MDCButton) {
        if operation == 0 {
            firstNumber += String(button.tag)
        } else {
            secondNumber += String(button.tag)
        }
        updateLabels()
    }

    @objc private func periodDigitButtonAction() {
        if operation == 0 {
            firstNumber += "."
        } else {
            secondNumber += "."
        }
        updateLabels()
    }

    @objc private func operationButtonAction(_ button: MDCButton) {

    }

    @objc private func delButtonAction() {
        if operation == 0 {
            firstNumber.popLast()
        } else {
            secondNumber.popLast()
        }
        updateLabels()
    }

    @objc private func acButtonAction() {
        resetEverything()
    }

    @objc private func equalsButtonAction() {
        print("=")
    }

    private func updateLabels() {
        let errorText: String = "Value too big"
        let labelText: String = (operation == 0) ? firstNumber : secondNumber
        let isDecimalTooBig: Bool =  Double(getDecimalText(labelText))! > Double(Int.max)

        decimalLabel.text = (isDecimalTooBig) ? errorText : getDecimalText(labelText)
        binaryLabel.text = (isDecimalTooBig) ? errorText : getBinaryText(labelText)
        hexLabel.text = (isDecimalTooBig) ? errorText : getHexText(labelText)
        octLabel.text = (isDecimalTooBig) ? errorText : getOctText(labelText)
    }

    private func getDecimalText(_ text: String) -> String {
        if activeBase == 0 {
            return text
        } else if activeBase == 1 {
            return text.binaryToDecimal
        } else if activeBase == 2 {
            return text.hexToDecimal
        } else if activeBase == 3 {
            return text.octToDecimal
        }
        return text
    }

    private func getBinaryText(_ text: String) -> String {
        if activeBase == 0 {
            return text.decimalToBinary
        } else if activeBase == 1 {
            return text
        } else if activeBase == 2 {
            return text.hexToBinary
        } else if activeBase == 3 {
            return text.octToBinary
        }
        return text
    }

    private func getHexText(_ text: String) -> String {
        if activeBase == 0 {
            return text.decimalToHex
        } else if activeBase == 1 {
            return text.binaryToHex
        } else if activeBase == 2 {
            return text
        } else if activeBase == 3 {
            return text.octToHex
        }
        return text
    }

    private func getOctText(_ text: String) -> String {
        if activeBase == 0 {
            return text.decimalToOct
        } else if activeBase == 1 {
            return text.binaryToOct
        } else if activeBase == 2 {
            return text.hexToOct
        } else if activeBase == 3 {
            return text
        }
        return text
    }

    private func toggleBaseButtons() {
        decimalButton.isSelected = activeBase == 0
        binaryButton.isSelected = activeBase == 1
        hexButton.isSelected = activeBase == 2
        octButton.isSelected = activeBase == 3
    }

    private func toggleDigitButtons() {
        aDigitButton.isEnabled = activeBase == 2
        bDigitButton.isEnabled = activeBase == 2
        cDigitButton.isEnabled = activeBase == 2
        dDigitButton.isEnabled = activeBase == 2
        eDigitButton.isEnabled = activeBase == 2
        fDigitButton.isEnabled = activeBase == 2
        twoDigitButton.isEnabled = activeBase != 1
        threeDigitButton.isEnabled = activeBase != 1
        fourDigitButton.isEnabled = activeBase != 1
        fiveDigitButton.isEnabled = activeBase != 1
        sixDigitButton.isEnabled = activeBase != 1
        sevenDigitButton.isEnabled = activeBase != 1
        eightDigitButton.isEnabled = activeBase == 0 || activeBase == 2
        nineDigitButton.isEnabled = activeBase == 0 || activeBase == 2

        aDigitButton.alpha = (aDigitButton.isEnabled) ? 1.0 : 0.5
        bDigitButton.alpha = (bDigitButton.isEnabled) ? 1.0 : 0.5
        cDigitButton.alpha = (cDigitButton.isEnabled) ? 1.0 : 0.5
        dDigitButton.alpha = (dDigitButton.isEnabled) ? 1.0 : 0.5
        eDigitButton.alpha = (eDigitButton.isEnabled) ? 1.0 : 0.5
        fDigitButton.alpha = (fDigitButton.isEnabled) ? 1.0 : 0.5
        twoDigitButton.alpha = (twoDigitButton.isEnabled) ? 1.0 : 0.5
        threeDigitButton.alpha = (threeDigitButton.isEnabled) ? 1.0 : 0.5
        fourDigitButton.alpha = (fourDigitButton.isEnabled) ? 1.0 : 0.5
        fiveDigitButton.alpha = (fiveDigitButton.isEnabled) ? 1.0 : 0.5
        sixDigitButton.alpha = (sixDigitButton.isEnabled) ? 1.0 : 0.5
        sevenDigitButton.alpha = (sevenDigitButton.isEnabled) ? 1.0 : 0.5
        eightDigitButton.alpha = (eightDigitButton.isEnabled) ? 1.0 : 0.5
        nineDigitButton.alpha = (nineDigitButton.isEnabled) ? 1.0 : 0.5
    }

    private func resetEverything() {
        firstNumber = ""
        secondNumber = ""
        operation = 0
        decimalLabel.text = "0"
        binaryLabel.text = "0"
        hexLabel.text = "0"
        octLabel.text = "0"
    }

}
