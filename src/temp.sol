pragma solidity 0.6.2;contract truncationError{ mapping(address => uint32) public balances; constructor() public{ } function receiveEther() public payable{ require(balances[msg.sender] + uint32(msg.value) >= balances[msg.sender]); balances[msg.sender] += uint32(msg.value); }}