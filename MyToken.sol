// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract LazerCoin is ERC20 {
    address private _owner;
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        _owner = msg.sender;
    }
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Caller is not the owner");
        _;
    }

    function decimals() public view virtual override returns (uint8) {
        return 12;
    }

    function totalSupply() public view virtual override returns (uint) {
        return 5000;
    }

    function mintCoin (uint _amount) public onlyOwner {
        _mint(_msgSender(), _amount);
    }

    function burnCoin(uint _amount) public {
        _burn(_msgSender(), _amount);
    }

    function transferCoin (address senderAddress, address receiverAddress, uint _amount) public {
        _transfer(senderAddress, receiverAddress, _amount);
    }
}
