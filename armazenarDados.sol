// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

//estrutura de dados que não aceitará
//dados iguais baseados no cpf

contract armazenarDados{

    struct tiposDados{
        string nome;
        string endereco;
        int idade;
    }

    mapping (string => tiposDados) private meuCadastro;
    string[] private cpfs;
    bool novoCPF;

    function verificarCFP(string memory meucpf) private view returns (bool){
        if(cpfs.length == 0){
            return true;
        }
        else{
            for (uint i = 0; i < cpfs.length; i++) {
                if (keccak256(abi.encodePacked(meucpf)) == 
                keccak256(abi.encodePacked(cpfs[i]))
                ) {

                return false;

                }
            }
        }

        return true;
    }

    function adicionarNovoCadastro
    (string memory cpf, string memory nome,
    string memory endereco, int idade) public{

        novoCPF = verificarCFP(cpf);
        require(novoCPF,"cpf existe no sistema");

        tiposDados memory dado = tiposDados(nome,endereco,idade);
        meuCadastro[cpf] = dado;
        cpfs.push(cpf);
    }

    function mostrarDados(string memory cpf)
    public view returns(tiposDados memory){
        return meuCadastro[cpf];
    }
} 