# Assignment 2 : Ethereum Bank Smart Contract

## Overview
This smart contract implements an Ethereum Bank with features like deposits, withdrawals, interest calculation, and owner-specific functions. It uses advanced Solidity concepts like ownership, modifiers, and state management to ensure security and proper functionality.

## Smart contract features

1. **Deposit Function:** Allow users to deposit Ether into the contract.
2. **Withdraw Function:** Allow users to withdraw Ether, with checks for sufficient balance.
3. **Interest Calculation:** Implement a function to calculate and display interest based on the user's balance and an interest rate set by the contract owner.
4. **Owner-Specific Functions:** Allow the contract owner to set the interest rate. Allow the owner to withdraw all funds from the contract for administrative purposes.
5. **Security:** Use modifiers to restrict access to owner-only functions. Validate all inputs to prevent misuse.
6. **Interaction:** Use different accounts in Remix to test ownership restrictions and user-specific balances.

## Instructions

1. Implement the contract code by completing the **TODO's** in `code.sol` and commit the changes either in Codespaces or Github Notepad.
2. Compile and deploy the contract using **Remix IDE**.
3. **Test Functions:**
   * Use the **deposit** function to deposit Ether.
   * Use the **withdraw** function to withdraw Ether.
   * Use the **calculateInterest** function to calculate interest.
   * Test **owner-specific** functions (set interest rate and withdraw all funds).


## Testing Steps in Remix IDE

1. Go to **Remix IDE** (https://remix.ethereum.org/)
2. Create a new file named `code.sol` and paste the contract code.
3. Compile the contract with Solidity version 0.8.0 or higher.
4. Deploy the contract on **Remix VM**.
5. Interact with the deployed contract using **deposit**, **withdraw**, **setInterestRate**, and **withdrawAll** functions.
6. Verify functionality by checking balances, interest calculations, and ensuring that only the owner can execute owner-specific functions.






