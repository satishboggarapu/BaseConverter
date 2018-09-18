//
//  MainViewController.swift
//  BaseConverter
//
//  Created by Satish Boggarapu on 9/16/18.
//  Copyright © 2018 SatishBoggarapu. All rights reserved.
//

import UIKit
import PinLayout

class MainViewController: UIViewController {

    //MARK: UIElements

    // base buttons
    private var decimalButton: UIButton!
    private var binaryButton: UIButton!
    private var hexButton: UIButton!
    private var octButton: UIButton!
    // base labels
    private var decimalLabel: UILabel!
    private var binaryLabel: UILabel!
    private var hexLabel: UILabel!
    private var octLabel: UILabel!
    // hex letters
    private var aDigitButton: UIButton!
    private var bDigitButton: UIButton!
    private var cDigitButton: UIButton!
    private var dDigitButton: UIButton!
    private var eDigitButton: UIButton!
    private var fDigitButton: UIButton!
    // 0-9 digits
    private var zeroDigitButton: UIButton!
    private var oneDigitButton: UIButton!
    private var twoDigitButton: UIButton!
    private var threeDigitButton: UIButton!
    private var fourDigitButton: UIButton!
    private var fiveDigitButton: UIButton!
    private var sixDigitButton: UIButton!
    private var sevenDigitButton: UIButton!
    private var eightDigitButton: UIButton!
    private var nineDigitButton: UIButton!
    private var periodDigitButton: UIButton!
    // operators and others
    private var delButton: UIButton!
    private var acButton: UIButton!
    private var multiplyButton: UIButton!
    private var divideButton: UIButton!
    private var addButton: UIButton!
    private var subtractButton: UIButton!
    private var equalsButton: UIButton!

    //MARK: Attributes



    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let rowHeight: CGFloat = (view.frame.height - Helper.getStatusBarHeight()) / 9.0
        let sixButtonRowWidth: CGFloat = view.frame.width / 6.0
        let fiveButtonRowWidth: CGFloat = view.frame.width / 5.0
        let zeroButtonWidth: CGFloat = fiveButtonRowWidth * 1.5

        // base buttons
        decimalButton.pin.left(to: view.edge.left).top(to: view.edge.top).marginTop(Helper.getStatusBarHeight()).width(rowHeight).height(rowHeight)
        binaryButton.pin.left(to: view.edge.left).top(to: decimalButton.edge.bottom).width(rowHeight).height(rowHeight)
        hexButton.pin.left(to: view.edge.left).top(to: binaryButton.edge.bottom).width(rowHeight).height(rowHeight)
        octButton.pin.left(to: view.edge.left).top(to: hexButton.edge.bottom).width(rowHeight).height(rowHeight)
        // base labels
        decimalLabel.pin.left(to: decimalButton.edge.right).right(to: view.edge.right).top(to: view.edge.top).height(rowHeight).marginRight(4)
        binaryLabel.pin.left(to: binaryButton.edge.right).right(to: view.edge.right).top(to: decimalLabel.edge.bottom).height(rowHeight).marginRight(4)
        hexLabel.pin.left(to: hexButton.edge.right).right(to: view.edge.right).top(to: binaryLabel.edge.bottom).height(rowHeight).marginRight(4)
        octLabel.pin.left(to: octButton.edge.right).right(to: view.edge.right).top(to: hexLabel.edge.bottom).height(rowHeight).marginRight(4)
        // hex letters
        aDigitButton.pin.left(to: view.edge.left).top(to: octButton.edge.bottom).width(sixButtonRowWidth).height(rowHeight)
        bDigitButton.pin.left(to: aDigitButton.edge.right).top(to: octButton.edge.bottom).width(sixButtonRowWidth).height(rowHeight)
        cDigitButton.pin.left(to: bDigitButton.edge.right).top(to: octButton.edge.bottom).width(sixButtonRowWidth).height(rowHeight)
        dDigitButton.pin.left(to: cDigitButton.edge.right).top(to: octButton.edge.bottom).width(sixButtonRowWidth).height(rowHeight)
        eDigitButton.pin.left(to: dDigitButton.edge.right).top(to: octButton.edge.bottom).width(sixButtonRowWidth).height(rowHeight)
        fDigitButton.pin.left(to: eDigitButton.edge.right).right(to: view.edge.right).top(to: octButton.edge.bottom).height(rowHeight)
        // 0-9 digits , .
        sevenDigitButton.pin.left(to: view.edge.left).top(to: aDigitButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight)
        eightDigitButton.pin.left(to: sevenDigitButton.edge.right).top(to: bDigitButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight)
        nineDigitButton.pin.left(to: eightDigitButton.edge.right).top(to: cDigitButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight)
        fourDigitButton.pin.left(to: view.edge.left).top(to: sevenDigitButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight)
        fiveDigitButton.pin.left(to: fourDigitButton.edge.right).top(to: eightDigitButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight)
        sixDigitButton.pin.left(to: fiveDigitButton.edge.right).top(to: nineDigitButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight)
        oneDigitButton.pin.left(to: view.edge.left).top(to: fourDigitButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight)
        twoDigitButton.pin.left(to: oneDigitButton.edge.right).top(to: fiveDigitButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight)
        threeDigitButton.pin.left(to: twoDigitButton.edge.right).top(to: sixDigitButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight)
        periodDigitButton.pin.left(to: view.edge.left).top(to: oneDigitButton.edge.bottom).bottom(to: view.edge.bottom).width(zeroButtonWidth)
        zeroDigitButton.pin.left(to: periodDigitButton.edge.right).top(to: twoDigitButton.edge.bottom).bottom(to: view.edge.bottom).width(zeroButtonWidth)
        // other buttons
        delButton.pin.left(to: nineDigitButton.edge.right).top(to: dDigitButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight)
        acButton.pin.left(to: delButton.edge.right).right(to: view.edge.right).top(to: fDigitButton.edge.bottom).height(rowHeight)
        multiplyButton.pin.left(to: sixDigitButton.edge.right).top(to: delButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight)
        divideButton.pin.left(to: multiplyButton.edge.right).right(to: view.edge.right).top(to: acButton.edge.bottom).height(rowHeight)
        addButton.pin.left(to: threeDigitButton.edge.right).top(to: multiplyButton.edge.bottom).width(fiveButtonRowWidth).height(rowHeight)
        subtractButton.pin.left(to: addButton.edge.right).right(to: view.edge.right).top(to: divideButton.edge.bottom).height(rowHeight)
        equalsButton.pin.left(to: zeroDigitButton.edge.right).right(to: view.edge.right).top(to: threeDigitButton.edge.bottom).bottom(to: view.edge.bottom)

    }

    // MARK: Initializer Functions

    private func setupView() {
        setupNavigationBar()
        setupBaseButtons()
        setupBaseLabels()
        setupHexLetterButtons()
        setupNormalDigitButtons()
        setupOtherButtons()
    }

    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func setupBaseButtons() {
        let textColor: UIColor = .black
        let backgroundColor: UIColor = .gray
        let font: UIFont = UIFont(name: "Avenir-Black", size: 18)!

        decimalButton = UIButton()
        decimalButton.setTitle("DEC", for: .normal)
        decimalButton.setTitleColor(textColor, for: .normal)
        decimalButton.backgroundColor = backgroundColor
        decimalButton.titleLabel?.font = font
        view.addSubview(decimalButton)

        binaryButton = UIButton()
        binaryButton.setTitle("BIN", for: .normal)
        binaryButton.setTitleColor(textColor, for: .normal)
        binaryButton.backgroundColor = backgroundColor
        binaryButton.titleLabel?.font = font
        view.addSubview(binaryButton)

        hexButton = UIButton()
        hexButton.setTitle("HEX", for: .normal)
        hexButton.setTitleColor(textColor, for: .normal)
        hexButton.backgroundColor = backgroundColor
        hexButton.titleLabel?.font = font
        view.addSubview(hexButton)

        octButton = UIButton()
        octButton.setTitle("OCT", for: .normal)
        octButton.setTitleColor(textColor, for: .normal)
        octButton.backgroundColor = backgroundColor
        octButton.titleLabel?.font = font
        view.addSubview(octButton)
    }

    private func setupBaseLabels() {
        let textColor: UIColor = .white

        decimalLabel = UILabel()
        decimalLabel.textColor = textColor
        decimalLabel.text = "0"
        decimalLabel.textAlignment = .right
        decimalLabel.contentMode = .center
        view.addSubview(decimalLabel)

        binaryLabel = UILabel()
        binaryLabel.textColor = textColor
        binaryLabel.text = "0"
        binaryLabel.textAlignment = .right
        binaryLabel.contentMode = .center
        view.addSubview(binaryLabel)

        hexLabel = UILabel()
        hexLabel.textColor = textColor
        hexLabel.text = "0"
        hexLabel.textAlignment = .right
        hexLabel.contentMode = .center
        view.addSubview(hexLabel)

        octLabel = UILabel()
        octLabel.textColor = textColor
        octLabel.text = "0"
        octLabel.textAlignment = .right
        octLabel.contentMode = .center
        view.addSubview(octLabel)
    }

    private func setupHexLetterButtons() {
        let textColor: UIColor = .white
        let backgroundColor: UIColor = .gray
        let font: UIFont = UIFont(name: "Avenir-Black", size: 18)!

        aDigitButton = UIButton()
        aDigitButton.setTitle("A", for: .normal)
        aDigitButton.setTitleColor(textColor, for: .normal)
        aDigitButton.backgroundColor = backgroundColor
        aDigitButton.titleLabel?.font = font
        view.addSubview(aDigitButton)

        bDigitButton = UIButton()
        bDigitButton.setTitle("B", for: .normal)
        bDigitButton.setTitleColor(textColor, for: .normal)
        bDigitButton.backgroundColor = backgroundColor
        bDigitButton.titleLabel?.font = font
        view.addSubview(bDigitButton)

        cDigitButton = UIButton()
        cDigitButton.setTitle("C", for: .normal)
        cDigitButton.setTitleColor(textColor, for: .normal)
        cDigitButton.backgroundColor = backgroundColor
        cDigitButton.titleLabel?.font = font
        view.addSubview(cDigitButton)

        dDigitButton = UIButton()
        dDigitButton.setTitle("D", for: .normal)
        dDigitButton.setTitleColor(textColor, for: .normal)
        dDigitButton.backgroundColor = backgroundColor
        dDigitButton.titleLabel?.font = font
        view.addSubview(dDigitButton)

        eDigitButton = UIButton()
        eDigitButton.setTitle("E", for: .normal)
        eDigitButton.setTitleColor(textColor, for: .normal)
        eDigitButton.backgroundColor = backgroundColor
        eDigitButton.titleLabel?.font = font
        view.addSubview(eDigitButton)

        fDigitButton = UIButton()
        fDigitButton.setTitle("F", for: .normal)
        fDigitButton.setTitleColor(textColor, for: .normal)
        fDigitButton.backgroundColor = backgroundColor
        fDigitButton.titleLabel?.font = font
        view.addSubview(fDigitButton)
    }

    private func setupNormalDigitButtons() {
        let textColor: UIColor = .white
        let backgroundColor: UIColor = .gray
        let font: UIFont = UIFont(name: "Avenir-Black", size: 18)!

        periodDigitButton = UIButton()
        periodDigitButton.setTitle(".", for: .normal)
        periodDigitButton.setTitleColor(textColor, for: .normal)
        periodDigitButton.backgroundColor = backgroundColor
        periodDigitButton.titleLabel?.font = font
        view.addSubview(periodDigitButton)

        zeroDigitButton = UIButton()
        zeroDigitButton.setTitle("0", for: .normal)
        zeroDigitButton.setTitleColor(textColor, for: .normal)
        zeroDigitButton.backgroundColor = backgroundColor
        zeroDigitButton.titleLabel?.font = font
        view.addSubview(zeroDigitButton)

        oneDigitButton = UIButton()
        oneDigitButton.setTitle("1", for: .normal)
        oneDigitButton.setTitleColor(textColor, for: .normal)
        oneDigitButton.backgroundColor = backgroundColor
        oneDigitButton.titleLabel?.font = font
        view.addSubview(oneDigitButton)

        twoDigitButton = UIButton()
        twoDigitButton.setTitle("2", for: .normal)
        twoDigitButton.setTitleColor(textColor, for: .normal)
        twoDigitButton.backgroundColor = backgroundColor
        twoDigitButton.titleLabel?.font = font
        view.addSubview(twoDigitButton)

        threeDigitButton = UIButton()
        threeDigitButton.setTitle("3", for: .normal)
        threeDigitButton.setTitleColor(textColor, for: .normal)
        threeDigitButton.backgroundColor = backgroundColor
        threeDigitButton.titleLabel?.font = font
        view.addSubview(threeDigitButton)

        fourDigitButton = UIButton()
        fourDigitButton.setTitle("4", for: .normal)
        fourDigitButton.setTitleColor(textColor, for: .normal)
        fourDigitButton.backgroundColor = backgroundColor
        fourDigitButton.titleLabel?.font = font
        view.addSubview(fourDigitButton)

        fiveDigitButton = UIButton()
        fiveDigitButton.setTitle("5", for: .normal)
        fiveDigitButton.setTitleColor(textColor, for: .normal)
        fiveDigitButton.backgroundColor = backgroundColor
        fiveDigitButton.titleLabel?.font = font
        view.addSubview(fiveDigitButton)

        sixDigitButton = UIButton()
        sixDigitButton.setTitle("6", for: .normal)
        sixDigitButton.setTitleColor(textColor, for: .normal)
        sixDigitButton.backgroundColor = backgroundColor
        sixDigitButton.titleLabel?.font = font
        view.addSubview(sixDigitButton)

        sevenDigitButton = UIButton()
        sevenDigitButton.setTitle("7", for: .normal)
        sevenDigitButton.setTitleColor(textColor, for: .normal)
        sevenDigitButton.backgroundColor = backgroundColor
        sevenDigitButton.titleLabel?.font = font
        view.addSubview(sevenDigitButton)

        eightDigitButton = UIButton()
        eightDigitButton.setTitle("8", for: .normal)
        eightDigitButton.setTitleColor(textColor, for: .normal)
        eightDigitButton.backgroundColor = backgroundColor
        eightDigitButton.titleLabel?.font = font
        view.addSubview(eightDigitButton)

        nineDigitButton = UIButton()
        nineDigitButton.setTitle("9", for: .normal)
        nineDigitButton.setTitleColor(textColor, for: .normal)
        nineDigitButton.backgroundColor = backgroundColor
        nineDigitButton.titleLabel?.font = font
        view.addSubview(nineDigitButton)
    }

    private func setupOtherButtons() {
        let textColor: UIColor = .white
        let backgroundColor: UIColor = .gray
        let font: UIFont = UIFont(name: "Avenir-Black", size: 18)!

        addButton = UIButton()
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(textColor, for: .normal)
        addButton.backgroundColor = backgroundColor
        addButton.titleLabel?.font = font
        view.addSubview(addButton)

        subtractButton = UIButton()
        subtractButton.setTitle("-", for: .normal)
        subtractButton.setTitleColor(textColor, for: .normal)
        subtractButton.backgroundColor = backgroundColor
        subtractButton.titleLabel?.font = font
        view.addSubview(subtractButton)

        multiplyButton = UIButton()
        multiplyButton.setTitle("x", for: .normal)
        multiplyButton.setTitleColor(textColor, for: .normal)
        multiplyButton.backgroundColor = backgroundColor
        multiplyButton.titleLabel?.font = font
        view.addSubview(multiplyButton)

        divideButton = UIButton()
        divideButton.setTitle("/", for: .normal)
        divideButton.setTitleColor(textColor, for: .normal)
        divideButton.backgroundColor = backgroundColor
        divideButton.titleLabel?.font = font
        view.addSubview(divideButton)

        delButton = UIButton()
        delButton.setTitle("DEL", for: .normal)
        delButton.setTitleColor(textColor, for: .normal)
        delButton.backgroundColor = backgroundColor
        delButton.titleLabel?.font = font
        view.addSubview(delButton)

        acButton = UIButton()
        acButton.setTitle("AC", for: .normal)
        acButton.setTitleColor(textColor, for: .normal)
        acButton.backgroundColor = backgroundColor
        acButton.titleLabel?.font = font
        view.addSubview(acButton)

        equalsButton = UIButton()
        equalsButton.setTitle("=", for: .normal)
        equalsButton.setTitleColor(textColor, for: .normal)
        equalsButton.backgroundColor = backgroundColor
        equalsButton.titleLabel?.font = font
        view.addSubview(equalsButton)
    }

}
