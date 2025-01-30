// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "forge-std/Test.sol";
import "../src/Exer01.sol";

contract Exer01Test is Test {
    Exer01 public exer;

    function setUp() public {
        exer = new Exer01();
    }

    function test_MaxNumber() public view {
        assertEq(exer.getMaxNumber(8, 12), 12);
        assertEq(exer.getMaxNumber(15, 9), 15);
        assertEq(exer.getMaxNumber(-5, 3), 3);
        assertEq(exer.getMaxNumber(7, 7), 7);
    }
}
