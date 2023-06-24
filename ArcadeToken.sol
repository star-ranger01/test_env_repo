pragma solidity ^0.5.0;

contract ArcadeToken {
	// Owner variable is the contract's owner responsible for managing the token. 
	// This code deploys the "Arcade Token", the "msg.sender" in this case will represent the account that creates the smart contract.
	address payable owner = msg.sender;

	// Symbol variable represents the token's ticker, similar to stock ticker
	string public symbol = ARCD;

	// The exchange rate is set at 1:100 ratio. For 1 wei = 100 ARCD tokens
	uint public exchange_rate = 100;
}
