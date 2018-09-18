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


    //MARK: Attributes



    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let rowHeight: CGFloat = (view.frame.height - Helper.getStatusBarHeight()) / 9.0
        let sixButtonRowWidth: CGFloat = view.frame.width / 6.0

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

    }

    // MARK: Initializer Functions

    private func setupView() {
        setupNavigationBar()
        setupBaseButtons()
        setupBaseLabels()
        setupHexLetterButtons()
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

}
