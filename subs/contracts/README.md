# bl3nd3r contracts

- deposit: Allow a user to deposit ETH in the mixer in order to break the
  connection between the depositor address and the withdrawer address.
- withdraw: Users will be able to withdraw deposited funds using a ZK proof
  (off-chain generated with Noir) of knowledge of their deposit
- only fixed amount are allowed (0.001 ETH, 0.01 ETH, 0.1 ETH, 1 ETH, 10 ETH,
  100 ETH)
