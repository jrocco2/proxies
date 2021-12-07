// test/Box.js
// Load dependencies
const { expect } = require('chai');
const { ethers, upgrades, storageLayout } = require("hardhat");
// const { upgrades } = require('@openzeppelin/hardhat-upgrades');

let MyToken;
let myToken;
let owner;
let addr1;
let addr2;
let addrs;

// Start test block
describe('MyToken', function () {
  beforeEach(async function () {
    [owner, addr1, addr2, ...addrs] = await ethers.getSigners();
    // myToken = await MyToken.deploy();
    // await myToken.deployed();
    // await myToken.initialize()

    MyToken = await ethers.getContractFactory("MyToken");
    myToken = await upgrades.deployProxy(MyToken, { kind: 'uups' });
  });
 
  // Test case
  it('should be initialised', async function () {
    console.log(await myToken.balanceOf(owner.address))
    console.log(await myToken.name())
    console.log(await myToken.symbol())
    console.log(await myToken.owner())
    expect(await myToken.balanceOf(owner.address)).to.equal(ethers.utils.parseEther("1000000"));
  });
});