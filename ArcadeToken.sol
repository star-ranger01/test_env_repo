pragma solidity ^0.5.0;

contract ArcadeToken {
	// Owner variable is the contract's owner responsible for managing the token. 
	// This code deploys the "Arcade Token", the "msg.sender" in this case will represent the account that creates the smart contract.
	address payable owner = msg.sender;

	// Symbol variable represents the token's ticker, similar to stock ticker
	string public symbol = "ARCD";

	// The exchange rate is set at 1:100 ratio. For 1 wei = 100 ARCD tokens
	uint public exchange_rate = 100;

	// Create a "mapping" called balances: mapping(KeyType => ValueType) balances
	mapping(address => uint) balances;

	// Create access for owner to view their account balances.
	function balance () public view returns (uint) {
	return balances[msg.sender];
	}

	// Create a way for the customers to transfer arcade tokens among each other.
	// NOTE: the function is vulnerable to users spending tokens that they do not have. Add more security for solution.
	function transfer(address recipient, uint value) public {
	balances[msg.sender] -= value;
	balances[recipient] += value;
	}

	// Create a way for customer to purchase tokens
	function purchase() public payable {
	uint amount = msg.value * exchange_rate;
	balances[msg.sender] += amount;
	owner.transfer(msg.value);
	}

	// Minting tokens: parameter value represent the number of "new" tokens while the parameter "recipient" represents any blockchain participant so that it is possible to add newly minted tokens to any customer's balance as needed; or in otherwords, if a customer purchases tokens, we can then have the contract mint those tokens and deposit them directly into the customer's account. Only the contractor's owner (the arcade owner) can mint or access the mint function via the "require () function."  
	function mint(address recipient, uint value) public {
	require(msg.sender == owner, "You do not have permission to mint tokens!");
	balances[recepient] += value;
	}
}
