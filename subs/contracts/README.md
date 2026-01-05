# bl3nd3r contracts

- deposit: Allow a user to deposit ETH in the mixer in order to break the
  connection between the depositor address and the withdrawer address.
- withdraw: Users will be able to withdraw deposited funds using a ZK proof
  (off-chain generated with Noir) of knowledge of their deposit
- only fixed amount are allowed (0.001 ETH, 0.01 ETH, 0.1 ETH, 1 ETH, 10 ETH,
  100 ETH)

## proof

- need to check commitment is present in a Merkle tree
  - proposed root
  - Merkle proof
- The merkle tree must be stored on-chain to benefit of the security of the
  ethereum network
  - We'll be using incremental Merkle Trees

### Incremental Merkle Trees

- Imagine we have to store the entire Merkle tree off-chain and only want to
  store the root on-chain.
  - Each update of any node would require a centralized system to initiate a
    Merkle root update on-chain.
    - This is bad
- Imagine we store the entire Merkle tree on chain
  - Decentralized (maintains trustlessness) indeed but...
  - Any modification requires to re calculate the entire tree on-chain
  - seems incredibly expensive
  - Bad too
- Solution are on-chain IMTs (Incremental Merkle Trees)
  - Efficient
  - scalable
  - updatable
- what are they
  - Fixed depth/height
    - fixed number of HOps (hash operations from a leaf to the root)
  - each leaves are initially `zeroed`
- How they are built on-chain
  - pre-populating the leaves with `zeroed` values initially
    - actually a constant value (e.g. hash("tornado"))
  - each level of the tree is also kind of `zeroed` using the hash of each
    subtree roots' leaves (as per a normal Merkle tree)
    - Can be represented as a constant in the smart contract even for big trees
      (depth of 20 means 20 `zero` constants)
  - when updated (modifying a leaf)
    - modified from left to right
    - any sub-tree that has been modified cannot be modified later on and can
      be cached
      - How many cached subtree do we need?
        - We only need to cache the roots of the smallest set of
          non-overlapping subtrees that fully represent the current state of
          the tree
        - Example: if I need to update the leaf at index `4` in a depth 3
          merkle tree
          - `4` is `100` in binary thus we need:
            - 1 cached subtree of depth 2
            - 0 subtree of depth 1 and 0
            - the more the index grow, the nearer we get to the merkle tree
              root
  - Hashing order
    - always let to right
    - even nodes are positioned to the left
    - odd nodes are positioned to the right
