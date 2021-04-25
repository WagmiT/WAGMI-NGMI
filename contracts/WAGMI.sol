pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./INGMI.sol";

contract WAGMI is ERC20 {
    INGMI ngmi;
    using SafeMath for uint256;
    uint256 public basePercent = 500;

    constructor(INGMI _ngmi) ERC20("Were All Gonna Make It", "WAGMI") {
        super._mint(msg.sender, 1000000000e18);
        ngmi = _ngmi;
    }

    function _printNGMI(address account, uint256 amount) private {
        ngmi.mint(account, amount);
    }

    function transfer(address to, uint256 amount)
        public
        override
        returns (bool)
    {
        uint256 tokensToBurn = cut(amount);
        uint256 tokensToTransfer = amount.sub(tokensToBurn);
        _printNGMI(_msgSender(), tokensToBurn);
        super._burn(_msgSender(), tokensToBurn);
        super.transfer(to, tokensToTransfer);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public override returns (bool) {
        uint256 tokensToBurn = cut(amount);
        uint256 tokensToTransfer = amount.sub(tokensToBurn);
        _printNGMI(from, tokensToBurn);
        super._burn(from, tokensToBurn);
        super.transferFrom(from, to, tokensToTransfer);
        return true;
    }

    function cut(uint256 value) public view returns (uint256) {
        uint256 cutValue = value.mul(basePercent).div(10000);
        return cutValue;
    }
}
