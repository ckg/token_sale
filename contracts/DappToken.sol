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

    // transfer event from function transfer
    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );
    // approve event from function approve
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address=>uint256) public balanceOf;
    //allowance
    mapping(address=>mapping(address=>uint256)) public allowance;

    //constructor
    //Read the total number of tokens
    constructor (uint _initialSupply) public{
        // allocate the initial supply
        balanceOf[msg.sender] = _initialSupply;
        //Set the total number of tokens
        totalSupply = _initialSupply;

    }

    // transfer
    function transfer(address _to, uint256 _value) public returns(bool success) {
        // exception if account doesn't have enough money
        require(balanceOf[msg.sender] >= _value);
        // transfer the balance
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        // transfer event
        emit Transfer(msg.sender, _to, _value);
        // return a boolean
        return true;
    }

    //Delegated Transfer
    //approve
    function approve(address _spender, uint256 _value) public returns(bool success){
        //allowance
        allowance[msg.sender][_spender] = _value;
        //approve event
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    //transferFrom
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        //require _from has enough tokens
        require(balanceOf[_from] >= _value);
        //require allowance is big enough
        require(allowance[_from][msg.sender] >= _value);
        //change the balance
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        //update the allowance
        allowance[_from][msg.sender] -= _value;
        //transferFrom event
        emit Transfer(_from, _to, _value);
        return true;
    }


}