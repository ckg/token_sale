pragma solidity  ^0.5.11;

contract DappToken{

    //Name
    string public name = "DApp Token";
    //Symbol
    string public symbol = "DAPP";
    //Standard
    string public standard = 'DApp Token v1.0';
    //Supply
    uint256 public totalSupply;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value 
    );

    mapping(address=>uint256) public balanceOf;

    //constructor
    //Read the total number of tokens
    constructor (uint _initialSupply) public{
        // allocate the initial supply
        balanceOf[msg.sender] = _initialSupply;
        //Set the total number of tokens
        totalSupply = _initialSupply;
        

    }

    // transfer
    // exception if account doesn't have enough money
    // return a boolean
    function transfer(address _to, uint256 _value) public returns(bool success) {
        require(balanceOf[msg.sender] >= _value);
        // transfer the balance
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        // transfer event
        emit Transfer(msg.sender, _to, _value);

        return true;
    } 


}