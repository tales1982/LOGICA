// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

/*
Exercício: Registro de Usuários
Crie um smart contract chamado UserRegistry que permita registrar usuários com nome e idade. O contrato deve conter as seguintes funcionalidades:

1- Adicionar Usuário

2- Deve haver uma função chamada addUser que recebe um nome (string) e uma idade (uint) e armazena essas informações associadas ao endereço do usuário que chamou a função.
Obter Dados do Usuário

3- Deve haver uma função chamada getUser que recebe um endereço e retorna o nome e a idade associados a esse endereço.
Modificar a Idade

4- Deve haver uma função chamada updateAge que permite que o usuário atualize apenas sua própria idade.
Garantir Restrições

Apenas o próprio usuário pode modificar sua idade.
A idade deve ser maior que 0.
O nome não pode ser vazio.
*/


contract UserRegistry {
    struct User {
        string name;
        uint age;
    }

    mapping(address => User) private users;

    event UserRegistered(address indexed user, string name, uint age);
    event AgeUpdated(address indexed user, uint newAge);

    function addUser(string memory _name, uint _age) public {
        require(bytes(_name).length > 0, "Nome nao pode ser vazio");
        require(_age > 0, "Idade deve ser maior que zero");
        require(bytes(users[msg.sender].name).length == 0, "Usuario ja registrado");

        users[msg.sender] = User(_name, _age);
        emit UserRegistered(msg.sender, _name, _age);
    }

    function getUser(address _user) public view returns (string memory, uint) {
        require(bytes(users[_user].name).length > 0, "Usuario nao encontrado");
        return (users[_user].name, users[_user].age);
    }

    function updateAge(uint _newAge) public {
        require(bytes(users[msg.sender].name).length > 0, "Usuario nao registrado");
        require(_newAge > 0, "Idade deve ser maior que zero");

        users[msg.sender].age = _newAge;
        emit AgeUpdated(msg.sender, _newAge);
    }
}
