// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CustomToken is ERC20, Ownable {
    constructor() ERC20("PRIYANSHU", "PRY") {}

    function mintTokens(address recipient, uint256 amount) public onlyOwner {
        _mint(recipient, amount);
    }

    function burnTokens(uint256 amount) public {
        uint256 senderBalance = balanceOf(msg.sender);
        if (senderBalance >= amount) {
            _burn(msg.sender, amount);
        } else {
            revert("Insufficient balance");
        }
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        if (recipient != address(0)) {
            return super.transfer(recipient, amount);
        } else {
            revert("Invalid recipient address");
        }
    }

    function getTotalSupply() public view returns (uint256) {
        return totalSupply();
    }
}
