// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract transacaoEther{
    
     string public dolar;
     mapping (address => string) public carteira;
     mapping (address => string) public meuEmprestimo;
     
    function transferir(address to, string memory extrato, string memory valor) public payable{
        payable(to).transfer(msg.value);
        carteira[msg.sender] = extrato;
        meuEmprestimo[msg.sender] = valor;
    }
}
