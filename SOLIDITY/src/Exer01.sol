// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

/*
Encontrar o Maior de Dois Números

📌 Objetivo: Criar uma função que recebe dois números inteiros e retorna o maior deles.

📌 O que você deve tentar implementar?

Criar uma função pública e pura.
Usar um operador condicional para comparar os dois números.
📌 Exemplo esperado:

solidity
Copiar
Editar
// Entrada: 8, 12
// Saída: 12

// Entrada: 15, 9
// Saída: 15
*/


contract Exer01{
    
    function getMaxNumber(int _a, int _b)public pure returns(int){
        return( _a >= _b ? _a : _b );
    }
}