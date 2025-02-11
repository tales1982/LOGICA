// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "forge-std/Test.sol";
import {UserRegistry} from "../src/Exer04.sol";

contract UserRegistryTest is Test {
    UserRegistry public exer;

    function setUp() public {
        exer = new UserRegistry();
    }

    // Teste para garantir que não é possível cadastrar usuário com nome vazio
    function testAddUserRevertForEmptyName() public {
        // Espera que a função reverta com a mensagem especificada
        vm.expectRevert("Nome nao pode ser vazio");
        exer.addUser("", 41);
    }
    
    // Teste para garantir que não é possível cadastrar usuário com idade zero
    function testAddUserRevertForZeroAge() public {
        vm.expectRevert("Idade deve ser maior que zero");
        exer.addUser("Alice", 0);
    }
    
    // Teste para cadastro bem-sucedido e verificação dos dados
    function testSuccessfulAddUser() public {
        exer.addUser("Alice", 30);
        // Após o cadastro, recupera os dados do usuário
        (string memory name, uint age) = exer.getUser(address(this));
        assertEq(name, "Alice", "Nome do usuario incorreto");
        assertEq(age, 30, "Idade do usuario incorreta");
    }
    
    // Exemplo de teste para a função updateAge
    function testUpdateAge() public {
        // Primeiro, cadastre o usuário
        exer.addUser("Bob", 25);
        
        // Atualize a idade
        exer.updateAge(26);
        
        // Verifique se a idade foi atualizada
        (, uint age) = exer.getUser(address(this));
        assertEq(age, 26, "A idade nao foi atualizada corretamente");
    }
}

/*
Pontos Importantes
Expectativa de Revert:
Use vm.expectRevert("mensagem") imediatamente antes de chamar a função que deverá falhar.

Funções que Alteram o Estado:
Remova a palavra-chave view dos testes que chamam funções que modificam o estado do contrato.

Verificando Eventos (Opcional):
Se quiser testar os eventos emitidos, pode usar funções do Forge-Std, como vm.expectEmit antes da chamada da função.
 */