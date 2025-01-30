// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

/*
Média de um Array de Números
📌 Objetivo: Criar uma função que recebe um array de inteiros e retorna a média dos valores.

📌 O que você deve tentar implementar?

Criar uma função pública e pura.
Calcular a soma de todos os elementos do array.
Retornar a média (soma / total de elementos).
📌 Exemplo esperado:

solidity
Copiar
Editar
// Entrada: [10, 20, 30, 40]
// Saída: 25
*/

contract Exer03 {
    
    function calc(int256[] memory _nums) public pure returns (int256) {
        require(_nums.length > 0, "O array nao pode estar vazio");

        int256 soma = 0;
        uint256 i = 0;
        
        while (i < _nums.length) { // Usando `while` para seguir as regras da 42
            soma += _nums[i];
            i++;
        }
        
        return soma / int256(_nums.length); // Calcula a média
    }
}
