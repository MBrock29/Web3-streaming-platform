// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Subscription {
    uint256 subscriptionAmount = 5e15;
    uint32 subscriptionLength = 30 * 24 * 60 * 60;

    struct SubscriptionDetails {
        uint256 startTime;
        uint256 endTime;
    }

    mapping(address => mapping(address => SubscriptionDetails))
        public subscriptions;

    event Subscribed(
        address indexed user,
        address indexed streamer,
        uint256 weiAmount,
        uint256 startTime,
        uint256 endTime
    );

    function subscribe(address streamer) public payable {
        require(msg.value == subscriptionAmount, "Incorrect subscription fee");

        uint256 startTime = block.timestamp;
        uint256 endTime = startTime + subscriptionLength;

        payable(streamer).transfer(msg.value);

        emit Subscribed(msg.sender, streamer, msg.value, startTime, endTime);
    }
}
