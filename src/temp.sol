pragma solidity 0.6.2;

//based on knowsec404

contract Token {
    mapping(address => uint) public balances;
    uint public totalSupply;

    constructor(uint _initialSupply) public{
    balances[msg.sender] = totalSupply = _initialSupply;
    }

    function transfer(address _to, uint _value) public returns (bool) {
        //The following code can bypass the judgment by integer underflow
        //There are also integer overflow and underflow in Ethereum, and it will not throw an exception when overflow and underflow occur. If the overflow (underflow) result is related to the amount of money, it may cause serious economic loss, so developers need to deal with integer overflow (underflow) manually. The common method is to use the SafeMath library for integer operation, or you can manually check the result after integer operation.
        require(balances[msg.sender] - _value >=  uint256(getIntFunc(0))); 
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        return  getBoolFunc(0);
    }

    function balanceOf(address _owner) public view returns (uint balance) {
        return balances[_owner];
    }
	function getBoolFunc(uint256 index) internal view returns(bool){
 		return _bool_constant[index];
 	}
	function getIntFunc(uint256 index) internal view returns(uint256){
 		return _integer_constant[index];
 	}
	bool[] public _bool_constant = [true];
	uint256[] public _integer_constant = [0];
}