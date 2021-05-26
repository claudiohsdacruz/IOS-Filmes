//
//  Filme.swift
//  Filmes
//
//  Created by Claudio Henrique Soares da Cruz on 25/05/21.
//

import Foundation

class Filme: NSObject {
    var nome: String
    var nota: Int
    var indicado: Bool
    var visualizacoes: Int
    
    override var description: String{
        return "\(self.nome) - \(self.nota) - \(self.visualizacoes)"
    }
    
    init(nome: String, nota: Int, indicado: Bool, visualizacoes: Int) {
        self.nome = nome
        self.nota = nota
        self.indicado = indicado
        self.visualizacoes = visualizacoes
    }
}

