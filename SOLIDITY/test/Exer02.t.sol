// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import {Test, console} from "forge-std/Test.sol";
import {Exer02} from "../src/Exer02.sol";

contract Exer02Test is Test {
    Exer02 public exer;

    function setUp()public {
        exer = new Exer02();
    }

    function test_ValueTrue()public view{
        assertTrue(exer.isPrime(7));
        assertTrue(exer.isPrime(2));
        assertTrue(exer.isPrime(13));
    }

        function test_ValueFalse()public view{
        assertFalse(exer.isPrime(10));
        assertFalse(exer.isPrime(15));
        assertFalse(exer.isPrime(1));
    }
}