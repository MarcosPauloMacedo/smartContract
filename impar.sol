// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

//Contrato que armazenará em uma estrutura de dados 
//apenas números ímpares

contract impar{
    int[] private numerosImpares;

    function adicionarNumerosImpares(int numero) public  {
        
        require(numero % 2 != 0,"apenas numeros impares");
        numerosImpares.push(numero);    
    }

    function mostrarNumeros() public view returns (int[] memory){
        return numerosImpares;
    }

    function reenviarNumero(int numero) public {
        numerosImpares.pop();
        adicionarNumerosImpares(numero);
    }
}