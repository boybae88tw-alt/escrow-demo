// contracts/Escrow.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    address public buyer;
    address public seller;
    bool public buyerOk;
    bool public sellerOk;

    constructor(address _buyer, address _seller) payable {
        buyer = _buyer; seller = _seller;
    }

    function approve() external {
        if (msg.sender == buyer) buyerOk = true;
        if (msg.sender == seller) sellerOk = true;
        if (buyerOk && sellerOk) payable(seller).transfer(address(this).balance);
    }
}
