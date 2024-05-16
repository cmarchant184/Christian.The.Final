const { expect } = require("chai");

describe("LoyaltyPoints", function () {
  let LoyaltyPoints;
  let loyaltyPoints;
  
  it("Should add loyalty points for an instructor", async function () {
    const starRating = 4; // Define star rating for the instructor
    const expectedPoints = 100;
    
    LoyaltyPoints = await ethers.getContractFactory("LoyaltyPoints");

    // loyaltyPoints = await LoyaltyPoints.deployed();
    loyaltyPoints = await LoyaltyPoints.deploy();
    const [owner, instructorWallet] = await ethers.getSigners();
    await loyaltyPoints.addLoyaltyPoints(instructorWallet, starRating);

    const instructorPoints = await loyaltyPoints.instructors(instructorWallet);
    console.log("---->",instructorPoints);
    expect(instructorPoints.loyaltyPoints).to.equal(expectedPoints);
  });
});


