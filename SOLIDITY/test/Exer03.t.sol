// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import {Test, console} from "forge-std/Test.sol";
import {Exer03} from "../src/Exer03.sol";

contract Exer03Test is Test {
    Exer03 public exer;
    int256[] valoresPositivos;
    int256[] valoresNegativos;
    int256[] valoresVazio;

    function setUp() public {
        exer = new Exer03();
        valoresPositivos = new int256[](4);
        valoresPositivos[0] = 10;
        valoresPositivos[1] = 20;
        valoresPositivos[2] = 30;
        valoresPositivos[3] = 40;

        valoresNegativos = new int256[](3);
        valoresNegativos[0] = -10;
        valoresNegativos[1] = -20;
        valoresNegativos[2] = -30;

        valoresVazio = new int256[](0);
    }

    function test_MediaCorreta() public view {
        int256 res = exer.calc(valoresPositivos);
        assertEq(res, 25, "A media deveria ser 25"); 
    }

    function test_ArrayVazio() public {
        vm.expectRevert("O array nao pode estar vazio"); 
        exer.calc(valoresVazio);
    }

    function test_MediaNegativa() public view {
        int256 res = exer.calc(valoresNegativos);
        assertEq(res, -20, "A media deveria ser -20"); 
    }
}