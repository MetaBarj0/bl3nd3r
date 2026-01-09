// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import { Field, Poseidon2 } from "@poseidon/src/Poseidon2.sol";

abstract contract IMT is Poseidon2 {
  using Field for uint256;

  uint8 public constant MAX_DEPTH = 20;
  string public constant ZERO = "bl3nd3r-zero";

  Field.Type public root;

  Field.Type[20] zeroes;

  constructor() {
    // NOTE: max_depth correspond to the level of the tree's root
    root = zeroHashForDepth_(MAX_DEPTH);

    // `zero` all the tree
  }

  function zeroHashForDepth_(uint8 level) private pure returns (Field.Type) {
    if (level == 0) {
      return hash_1(uint256(keccak256(bytes(ZERO))).toField());
    }
  }

  function insert_(bytes32 leaf_) internal { }
}
