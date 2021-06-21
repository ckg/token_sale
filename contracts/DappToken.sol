pragma solidity  ^0.5.11;

contract DappToken{

    uint256 public totalSupply;

    //constructor
    //Set the total number of tokens
    //Read the total number of tokens
    constructor () public{
        totalSupply = 1000000;
    }

}