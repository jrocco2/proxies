// test/Box.js
// Load dependencies
const { expect } = require('chai');
const { ethers, upgrades, storageLayout } = require("hardhat");
// const { upgrades } = require('@openzeppelin/hardhat-upgrades');

let MyToken, myToken, owner, addr1, addr2, addrs;

// Start test block
describe('MyToken', function () {
  beforeEach(async function () {
    [owner, addr1, addr2, ...addrs] = await ethers.getSigners();
    // myToken = await MyToken.deploy();
    // await myToken.deployed();
    // await myToken.initialize()

    MyToken = await ethers.getContractFactory("MyToken");
    myToken = await upgrades.deployProxy(MyToken, { kind: 'uups' });
    console.log("address: ", myToken.address)
  });
 
  // Test case
  it('should be initialised', async function () {
    console.log(await myToken.balanceOf(owner.address))
    console.log(await myToken.name())
    console.log(await myToken.symbol())
    console.log(await myToken.owner())
    expect(await myToken.balanceOf(owner.address)).to.equal(ethers.utils.parseEther("1000000"));
  });

  it('should be upgradeable', async function () {
    let MyTokenV2 = await ethers.getContractFactory("MyTokenV2");
    let myTokenV2 = await upgrades.upgradeProxy(myToken.address, MyTokenV2);
    await myTokenV2.initializeV2()
    console.log(await myTokenV2.balanceOf(owner.address))
    console.log(await myTokenV2.name())
    console.log(await myTokenV2.symbol())
    console.log(await myTokenV2.owner())
    console.log(await myTokenV2.myInt())
    expect(await myTokenV2.balanceOf(owner.address)).to.equal(ethers.utils.parseEther("1000000"));
  });
});