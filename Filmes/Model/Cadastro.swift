//
//  Cadastro.swift
//  Filmes
//
//  Created by Claudio Henrique Soares da Cruz on 25/05/21.
//

import Foundation

class Cadastro {
    private var lista: Array<Filme>
    private var filmeParaEdicao: Int
    
    init() {
        self.lista = Array()
        self.filmeParaEdicao = -1
    }
    
    func add(filme: Filme) {
        self.lista.append(filme)
    }
    
    func count() -> Int {
        return self.lista.count
    }
    
    func get(index: Int) -> Filme {
        return self.lista[index]
    }
    
    func get() -> Array<Filme> {
        return self.lista
    }
    
    func del(index: Int) {
        self.lista.remove(at: index)
    }
    
    func mov(de: Int, para: Int){
        let filmeDe = self.lista[de]
        let filmePara = self.lista[para]
        if (de != para - 1){
            self.lista[para] = filmeDe
            for n in 0...(para - 1){
                self.lista[n] = self.lista[de + n + 1]
            }
            self.lista[para - 1] = filmePara
        } else {
            self.lista[para] = filmeDe
            self.lista[de] = filmePara
        }
    }
    
    func update(index: Int, filme: Filme){
        self.lista[index] = filme
    }
}
