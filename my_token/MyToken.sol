pragma solidity ^0.5.0;

/**
* @title MyToken
* @dev Create custom token
* @custom:dev-run-script file_path
*/

contract MyToken {
	// Set owner of this contract who will accept payment and distribute custom tokens.
	address payable owner = msg.sender;

	// Symbol for the token.
	string public symbol = "MYTKN";

	// Exchange rate for "fungibility" to distribute per 1 wei.
	uint exchange_rate = 100;
	
	function () public {}
}
