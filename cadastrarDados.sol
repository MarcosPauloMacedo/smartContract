// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

//Contrato que armazenará em pares de chaves
// e valores, dados pessoais.

contract cadastrarDados{
    struct dadosCadastrais{
        string endereco;
        int idade;
    }

    mapping(string => dadosCadastrais) private dados;

    function enviarCadastro(
    string memory nome, string memory endereco, int idade)
    public {
        dadosCadastrais memory dado = dadosCadastrais(endereco,idade);
        dados[nome] = dado;
    }

    function mostrarDados(string memory nome)
    public view returns (dadosCadastrais memory){
        return dados[nome];
    }
}