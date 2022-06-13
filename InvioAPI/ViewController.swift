//
//  ViewController.swift
//  InvioAPI
//
//  Created by irem TOSUN on 2.06.2022.
//

import UIKit

class ViewController: UIViewController {
    var factory: ViewControllerFactory!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /*
               let appDelegate = UIApplication.shared.delegate as! AppDelegate
                factory = ViewControllerFactory(assembler: appDelegate.assembler!)

                let next = factory.searchMovie()
                guard let nextViewController = next as? UIViewController else { return }
                nextViewController.modalPresentationStyle = .fullScreen
                nextViewController.modalTransitionStyle = .crossDissolve
                present(nextViewController, animated: false)
         */
    }
}
