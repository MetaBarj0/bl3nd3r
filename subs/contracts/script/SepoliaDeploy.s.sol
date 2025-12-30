// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.30;

import { Script } from "forge-std/Script.sol";
import { Vm } from "forge-std/Vm.sol";

contract SepoliaDeployScript is Script {
  Vm.Wallet private wallet;

  function setUp() public {
    uint256 pk = vm.envUint("PRIVATE_KEY");
    wallet = vm.createWallet(pk);
  }

  function run() public {
    vm.startBroadcast(wallet.privateKey);
    vm.stopBroadcast();
  }

  // NOTE: To mute uncovered items in coverage reports
  function test() private { }
}

