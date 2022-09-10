// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract enviarEther{

    mapping(address => string) public extrato; 
    mapping(address => string) public valor;

    function enviarMoeda(address to, string memory _extrato, string memory _valor) public payable{
        payable(to).transfer(msg.value);
        extrato[msg.sender] = _extrato;
        valor[msg.sender] = _valor;
    }
}