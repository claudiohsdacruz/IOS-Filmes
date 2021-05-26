//
//  ViewController.swift
//  Filmes
//
//  Created by Claudio Henrique Soares da Cruz on 25/05/21.
//

import UIKit

class FormViewController: UIViewController {
    var cadastro: Cadastro!
    var filmeEditavel: Int!
    
    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var sldNota: UISlider!
    @IBOutlet weak var lblNota: UILabel!
    @IBOutlet weak var swtIndicado: UISwitch!
    @IBOutlet weak var stpVisualizacoes: UIStepper!
    @IBOutlet weak var lblQuantidade: UILabel!
    
    @IBAction func definirNota(_ sender: Any) {
        self.lblNota.text = String(Int(sldNota.value))
    }
    
    @IBAction func definirVisualizacoes(_ sender: Any) {
        self.lblQuantidade.text = String(Int(stpVisualizacoes.value))
    }
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.cadastro = (UIApplication.shared.delegate as! AppDelegate).cadastro
    }
    
    
    @IBAction func salvar(_ sender: Any) {
        let nome = self.tfNome.text!
        let nota = Int(self.sldNota.value)
        let indicado = self.swtIndicado.isOn
        let visualizacoes = Int(self.stpVisualizacoes.value)
        let filme = Filme(nome: nome, nota: nota, indicado: indicado, visualizacoes: visualizacoes)
        
        if (self.filmeEditavel != nil){
            // editar
            self.cadastro.update(index: self.filmeEditavel, filme: filme)
        } else {
            // inserir
            self.cadastro.add(filme: filme)
        }
       
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if (self.filmeEditavel != nil){
            let filme = self.cadastro.get(index: self.filmeEditavel)
            self.tfNome.text = filme.nome
            self.sldNota.value = Float(filme.nota)
            self.lblNota.text = String(Int(self.sldNota.value))
            self.swtIndicado.isOn = Bool(filme.indicado)
            self.stpVisualizacoes.value = Double(filme.visualizacoes)
            self.lblQuantidade.text = String(Int(self.stpVisualizacoes.value))
        }
    }
    
}

