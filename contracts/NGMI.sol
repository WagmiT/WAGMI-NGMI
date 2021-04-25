pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract NGMI is ERC20, Ownable {
    constructor() ERC20("Not Gonna Make It", "NGMI") {
    }

    function mint(address account, uint256 amount) public onlyOwner {
        super._mint(account, amount);
    }
}