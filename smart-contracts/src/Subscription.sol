// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Subscription {
    uint256 subscriptionAmount = 5e18;

    event Subscribed(
        address indexed user,
        address indexed streamer,
        uint256 weiAmount,
        uint256 contractBalance
    );

    function subscribe(address streamer) public payable {
        require(msg.value == subscriptionAmount, "Incorrect subscription fee");
        payable(streamer).transfer(msg.value);

        emit Subscribed(msg.sender, streamer, msg.value, address(this).balance);
    }
}
