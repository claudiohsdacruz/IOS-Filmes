//
//  ListaTableViewController.swift
//  Filmes
//
//  Created by Claudio Henrique Soares da Cruz on 25/05/21.
//

import UIKit

class ListaTableViewController: UITableViewController {
    
    var cadastro: Cadastro!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.cadastro = (UIApplication.shared.delegate as! AppDelegate).cadastro
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        self.adicionaFilme()
    }
    
    func adicionaFilme(){
        self.cadastro.add(filme: Filme(nome: "Filme 1", nota: 7, indicado: true, visualizacoes: 2))
        self.cadastro.add(filme: Filme(nome: "Filme 2", nota: 8, indicado: false, visualizacoes: 2))
        self.cadastro.add(filme: Filme(nome: "Filme 3", nota: 9, indicado: true, visualizacoes: 2))
        self.cadastro.add(filme: Filme(nome: "Filme 4", nota: 6, indicado: false, visualizacoes: 2))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cadastro.count()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filme", for: indexPath)

        let filme = cadastro.get(index: indexPath.row)
        
        cell.textLabel?.text = filme.nome
        cell.detailTextLabel?.text = String(filme.nota)

        return cell
    }


    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.cadastro.del(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        self.cadastro.mov(de: fromIndexPath.row, para: to.row)
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let filme = self.cadastro.get(index: indexPath.row)
        let fvc = self.storyboard?.instantiateViewController(identifier: "novo") as! FormViewController
        fvc.filmeEditavel = indexPath.row
        self.navigationController?.pushViewController(fvc, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
    }
}
