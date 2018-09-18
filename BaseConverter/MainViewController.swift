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
    private var decimalButton: UIButton!
    private var decimalLabel: UILabel!
    private var binaryButton: UIButton!
    private var binaryLabel: UILabel!
    private var hexButton: UIButton!
    private var hexLabel: UILabel!
    private var octButton: UIButton!
    private var octLabel: UILabel!



    //MARK: Attributes



    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let baseButtonSize: CGFloat = (view.frame.height - Helper.getStatusBarHeight()) / 9.0

        // view constraints
        decimalButton.pin.left(to: view.edge.left).top(to: view.edge.top).marginTop(Helper.getStatusBarHeight()).width(baseButtonSize).height(baseButtonSize)
        binaryButton.pin.left(to: view.edge.left).top(to: decimalButton.edge.bottom).width(baseButtonSize).height(baseButtonSize)
        hexButton.pin.left(to: view.edge.left).top(to: binaryButton.edge.bottom).width(baseButtonSize).height(baseButtonSize)
        octButton.pin.left(to: view.edge.left).top(to: hexButton.edge.bottom).width(baseButtonSize).height(baseButtonSize)
        decimalLabel.pin.left(to: decimalButton.edge.right).right(to: view.edge.right).top(to: view.edge.top).height(baseButtonSize).marginRight(4)
        binaryLabel.pin.left(to: binaryButton.edge.right).right(to: view.edge.right).top(to: decimalLabel.edge.bottom).height(baseButtonSize).marginRight(4)
        hexLabel.pin.left(to: hexButton.edge.right).right(to: view.edge.right).top(to: binaryLabel.edge.bottom).height(baseButtonSize).marginRight(4)
        octLabel.pin.left(to: octButton.edge.right).right(to: view.edge.right).top(to: hexLabel.edge.bottom).height(baseButtonSize).marginRight(4)
    }

    // MARK: Initializer Functions

    private func setupView() {
        setupNavigationBar()
        setupBaseButtons()
        setupBaseLabels()
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
        view.addSubview(decimalLabel)

        binaryLabel = UILabel()
        binaryLabel.textColor = textColor
        binaryLabel.text = "0"
        binaryLabel.textAlignment = .right
        view.addSubview(binaryLabel)

        hexLabel = UILabel()
        hexLabel.textColor = textColor
        hexLabel.text = "0"
        hexLabel.textAlignment = .right
        view.addSubview(hexLabel)

        octLabel = UILabel()
        octLabel.textColor = textColor
        octLabel.text = "0"
        octLabel.textAlignment = .right
        view.addSubview(octLabel)
    }

}
