// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.2/access/Ownable.sol";

contract LoyaltyPoints {
    // Structure to store instructor's details
    struct Instructor {
        uint256 loyaltyPoints; // Total loyalty points
        uint256 totalRatings; // Total number of ratings received
    }

    // Mapping to store instructors' details
    mapping(address => Instructor) public instructors;

    // Admin address
    address public admin;

    // Minimum star rating required to receive loyalty points
    uint256 public minStarRating = 4;

    // Event to log when loyalty points are added
    event LoyaltyPointsAdded(address indexed instructor, uint256 pointsAdded);

    // Constructor to set the admin
    constructor() {
        admin = msg.sender;
    }

    // Function to add loyalty points for an instructor
    function addLoyaltyPoints(address instructorWallet, uint256 starRating) external onlyAdmin {
        require(starRating >= minStarRating, "Star rating not high enough");
        
        // Update instructor's details
        Instructor storage instructor = instructors[instructorWallet];
        instructor.loyaltyPoints += starRating;
        instructor.totalRatings++;

        emit LoyaltyPointsAdded(instructorWallet, starRating);
    }

    // Modifier to restrict access to the admin
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }
}
