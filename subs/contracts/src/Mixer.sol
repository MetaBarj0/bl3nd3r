// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

interface IVerifier { }

contract Mixer {
  IVerifier public immutable verifier;

  /// @notice Deploy this Mixer contract
  /// @param verifier_ A Verifier smart contract able to verify zk proofs
  constructor(IVerifier verifier_) {
    verifier = verifier_;
  }

  /// @notice deposit funds into the Mixer
  /// @param commitment_ the poseidon commitment of the secret and the
  ///        nullifier computed off-chain
  function deposit(bytes32 commitment_) external {
    // - ensure the user send the correct fixed amount of ETH (denomination)
    // - check if commitment_ has already been used (prevent double deposit)
    // - add the commitment_ to a datastructure containing all commitments
    // -
  }

  /// @notice Withdraw funds from the Mixer in way that protect privacy
  /// @param proof_ the proof of a previously used commitment in a deposit
  ///        function call. It proves the user has the right to withdraw funds.
  function withdraw(bytes memory proof_) external {
    // - check the proof is valid by calling a Verifier contract
    // - the nullifier has not been used to prevent double withdraw
    // - send the funds to the caller
  }
}
