// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

//contrato que recebe e envia suas criptos de volta;

contract transacoes{
    mapping (address => uint) private carteira;

    function EnviarValor() public payable {
        carteira[msg.sender] += msg.value;
    }

    function mostrarSaldoContrato()
    public view returns (uint){
        return carteira[msg.sender];
    }

    function receberValor(address payable minhaCarteira, uint valor) 
    public {
        uint saldo = carteira[minhaCarteira];
        
        require(valor <= saldo,"saldo insuficiente");

        minhaCarteira.transfer(valor);
        carteira[minhaCarteira] -= valor;
    }
}