// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.30;

import { Script } from "forge-std/Script.sol";
import { Vm } from "forge-std/Vm.sol";

contract LocalDeployScript is Script {
  address private sender;

  function setUp() public {
    sender = vm.envAddress("TEST_SENDER_ADDRESS");
  }

  function run() public {
    vm.startBroadcast(sender);
    vm.stopBroadcast();
  }

  // NOTE: To mute uncovered items in coverage reports
  function test() private { }
}

