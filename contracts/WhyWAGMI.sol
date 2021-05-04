pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/Context.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WhyWAGMI is Context, Ownable {
    event SendMessage(address indexed _from, string _message);
    struct Message {
        string message;
        address author;
    }
    Message[] public messages;
    IERC20 public wagmi;
    uint256 public feeCost;

    constructor(IERC20 _wagmi) {
        wagmi = _wagmi;
        feeCost = 1000;
    }

    function setFee(uint256 _feeCost) public onlyOwner {
        feeCost = _feeCost;
    }

    function sendMessage(string memory message) public {
        wagmi.transferFrom(
            _msgSender(),
            address(1),
            feeCost * 10e18
        );
        address author = _msgSender();
        emit SendMessage(author, message);
        messages.push(Message(message, author));
    }

    function messagesCount() public view returns (uint256) {
        return messages.length;
    }
}
