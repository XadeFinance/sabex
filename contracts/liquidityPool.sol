// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
// import "./@node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "./tokenCreate.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract liquidityPool is ReentrancyGuard {
    // constructor () tokenCreate() {}

    //  function getMyBalance() public view returns(uint){
    //      return balanceOf(msg.sender);
    //  }

    uint256 public WBTCReserve;
    uint256 public borrowedWBTC;
    mapping(address => uint256) public userLiquidity;
    mapping(address => uint256) public userDepositedCUSD;
    mapping(address => mapping(address => uint256)) userXtoken;
    mapping(address => uint256) public borrow;

    //function to deposit WBTC in reserve
    // function provideLiquidity(
    //     address _provider,
    //     uint256 _WBTCAmount
    // ) external payable returns (bool) {
    //     uint256 previousReserve = WBTCReserve;
    //     WBTCReserve += _WBTCAmount;
    //     userLiquidity[_provider] = _WBTCAmount;
    //     if (previousReserve >= WBTCReserve) {
    //         return false;
    //     } else {
    //         return true;
    //     }
    // }

    //function to borrowWBTC amount against collateral (WETH etc.)
    // function borrowWBTC(
    //     address _borrower,
    //     uint256 _WBTCAmount
    // ) external payable returns (uint256) {
    //     require(
    //         WBTCReserve > _WBTCAmount,
    //         "Pool does not have sufficient fund!"
    //     );
    //     borrow[_borrower] = _WBTCAmount;
    //     WBTCReserve -= _WBTCAmount;
    //     borrowedWBTC += _WBTCAmount;
    //     return _WBTCAmount;
    // }

    // function amountDeposited() external view returns (uint256) {
    //     return WBTCReserve + borrowedWBTC;
    // }

    // function amountBorrowed() external view returns (uint256) {
    //     return borrowedWBTC;
    // }

    function amountDepositedByUser() public view returns (uint256) {
        return userDepositedCUSD[msg.sender];
    }

    function depositERC20Token(uint amount) external {
        IERC20(0x874069Fa1Eb16D44d622F2e0Ca25eeA172369bC1).transferFrom(
            msg.sender,
            address(this),
            amount
        );
        userDepositedCUSD[msg.sender] += amount;
    }

    function withdrawERC20Token(uint256 amount) external nonReentrant {
        require(amount <= amountDepositedByUser(), "Insufficient Funds");
        // TODO: This is CUSD testnet. You will have to change this to the mainnet address, or even better, make a CUSD variable and initialize in the constructor
        IERC20(0x874069Fa1Eb16D44d622F2e0Ca25eeA172369bC1).transfer(
            msg.sender,
            amount
        );
    }
}
