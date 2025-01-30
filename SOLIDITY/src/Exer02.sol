// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;
/*
Número Primo
📌 Objetivo: Criar uma função que verifica se um número é primo.

📌 O que você deve tentar implementar?

Criar uma função pública e pura.
Retornar true se for primo, false caso contrário.
Um número é primo se for maior que 1 e só for divisível por 1 e por ele mesmo.
📌 Exemplo esperado:

solidity
Copiar
Editar
// Entrada: 7
// Saída: true

// Entrada: 10
// Saída: false
*/

contract Exer02 {

    function isPrime(uint _num) public pure returns (bool) {
        if (_num < 2) {
            return false; // Números menores que 2 não são primos
        }
        for (uint i = 2; i * i <= _num; i++) { // Verifica divisores até a raiz quadrada de _num
            if (_num % i == 0) {
                return false; // Se for divisível por qualquer número além de 1 e ele mesmo, não é primo
            }
        }
        return true; // Se passou pelo loop sem encontrar divisores, é primo
    }
}