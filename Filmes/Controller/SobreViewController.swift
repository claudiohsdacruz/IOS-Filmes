//
//  SobreViewController.swift
//  Filmes
//
//  Created by Claudio Henrique Soares da Cruz on 25/05/21.
//

import UIKit

class SobreViewController: UIViewController {
    
    var cadastro: Cadastro!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.cadastro = (UIApplication.shared.delegate as! AppDelegate).cadastro
    }
    

}
