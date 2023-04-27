// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "kairos-contracts/Init.sol";
import "ds-test/test.sol";



contract TestInit is DSTest {
    Init public init;
    address payable public protocolTreasury;
    uint24 public protocolFeePercentage;
    uint24 public updateProtocolFeePercentage;
    address public updateProtocolTreasury;

    function setUp() external {
        init = new Init();
        protocolTreasury = payable(address(0));
        protocolFeePercentage = 0;
    }

    function testProtocolFeePercentage() public {
        assertEq(protocolFeePercentage, 0);
        init.updateProtocolFeePercentage(100);
        protocolFeePercentage = init.protocolFeePercentage();

        assertEq(protocolFeePercentage, 100);
    }

    function testProtocolTreasury() public {
        assertEq(protocolTreasury, address(0));
        init.updateProtocolTreasury(payable(address(1)));
        protocolTreasury = init.protocolTreasury();
        assertEq(protocolTreasury, address(1));
    }
}















