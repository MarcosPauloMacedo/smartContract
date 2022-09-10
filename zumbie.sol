// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


contract ZombieFactory {

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct zumbi{
        string nome;
        uint dna;
    }

    zumbi[] public zombies;
    zumbi satoshi = zumbi("satoshi",172);
    zumbi vitalik = zumbi('vitalik',168);

    event NewZombie(uint zombieId, string name, uint dna);

    function listaZumbi() private {

        zombies.push(satoshi);
        zombies.push(vitalik);
        zombies.push(zumbi('nakamoto',212));
    }

    function createZombies(string memory _zombie,
    uint _dna) private {
        zombies.push(zumbi(_zombie,_dna));
        uint _zombieId = zombies.length;
        emit NewZombie(_zombieId, _zombie, _dna);
    }

    function _generateRandomDna(string memory _nome) private pure returns(bytes32){
        
       return keccak256(abi.encodePacked(_nome));
    }

    function createRandomZombie(string memory _name) public {
        uint randDna = uint(_generateRandomDna(_name));
        createZombies(_name, randDna);
    }
}


