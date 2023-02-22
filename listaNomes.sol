// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

//contrato que armazenará em uma estrutura de dados
//apenas nomes 

contract listaNomes{
    string[] private nomes;

    function adicionarNome(string memory _nome)
    public returns (string memory){
        nomes.push(_nome);
        return "nome armazenado com sucesso!";
    }

    function editarNome(string memory _nome) public {
        nomes.pop();
        adicionarNome(_nome);
    }

    function mostrarNomes()
    public view returns (string [] memory){
        return nomes;
    }
}