// Right click on the script name and hit "Run" to execute
const { expect } = require("chai");
const { ethers } = require("hardhat");


describe("Liquidity Pool", function () {
    let pool,Pool;
    beforeEach(async () => {
    Pool = await ethers.getContractFactory("liquidityPool");
    pool = await Pool.deploy();
    await pool.deployed();
    
  });
  describe("deposit",()=>{
      it("test initial value", async function () {
    await pool.deployed();
    expect((await pool.amountDepositedByUser()).toNumber()).to.equal(0);
})

 describe("sum",()=>{
     it("5",async function(){
         expect(5).to.equal(5);
     })
 })
  
});

