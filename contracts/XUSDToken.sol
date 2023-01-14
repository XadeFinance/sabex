// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract XadeUSDToken is ERC20{
    constructor(string memory tokenName, string memory tokenSymbol) ERC20(tokenName, tokenSymbol){
        _mint(msg.sender, 10 * (10**18));
    }
    
   function  transferAmount(address  payable _reciever, uint256 _amount) public 
   {
     require(balanceOf(msg.sender) >= _amount, "Insufficient balance");

        // Transfer the tokens
        require(ERC20.transfer(_reciever, _amount), "Transfer failed");
   }
}
