//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.6;

// Implementation of a Constant Product Automated Market Maker
contract LiquidityPool {
    
    uint constant private k = 2500000000;
    
    uint public apples = 50000;
    uint public potatoes = 50000;
    
    function buyApples(uint _applesToBuy) public returns (uint costInPotatoes) {
        apples -= _applesToBuy;
        uint newPotatoesAmount = k / apples;
        costInPotatoes = newPotatoesAmount - potatoes;
        potatoes += costInPotatoes;
    }
    
    function sellApples(uint _applesToSell) public returns (uint boughtPotatoes) {
        apples += _applesToSell;
        uint newPotatoesAmount = k / apples;
        boughtPotatoes = potatoes - newPotatoesAmount;
        potatoes = newPotatoesAmount;
    }
    
    function buyPotatoes(uint _potatoesToBuy) external returns (uint costInApples) {
        potatoes -= _potatoesToBuy;
        uint newApplesAmount = k / potatoes;
        costInApples = newApplesAmount - apples;
        apples += costInApples;
    }
    
    function sellPotatoes(uint _potatoesToSell) external returns (uint boughtApples) {
        potatoes += _potatoesToSell;
        uint newApplesAmount = k / potatoes;
        boughtApples = apples - newApplesAmount;
        apples = newApplesAmount;
    }
}
