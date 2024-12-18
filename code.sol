// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AdvancedBank {
    address public owner; // The owner of the contract
    mapping(address => uint256) private balances; // Stores user balances
    uint256 public interestRate; // Annual interest rate in percentage (e.g., 5 means 5%)

    // Constructor to initialize the owner
    constructor() {
        // TODO: Set the contract deployer as the owner
        owner=msg.sender;
    }

    // Modifier to restrict access to owner-only functions
    modifier onlyOwner() {
        // TODO: Add a require statement to ensure msg.sender is the owner
        require(owner==msg.sender,"only owner do this action");
        _;
    }
    modifier inputvalidation(uint256 _value){
        require(_value > 0,"invalid amount received");
        _;
    }

    // Function to deposit Ether into the bank
    function deposit() public payable  {
        /* TODO:
        1) Check that the deposit amount is greater than zero
        2) update the balance for the receiver
        */
        require(msg.value>0,"invalid amount received");
        balances[msg.sender]+=msg.value;
    }

    // Function to withdraw Ether from the bank
    function withdraw(uint256 amount) public inputvalidation(amount)  {
        /* TODO:
        1) Check if the sender's balance is sufficient for the withdrawl
        2) Deduct the amount from the sender's balance
        3) Transfer Ether to the sender
        */

        uint256 balance = balances[msg.sender];

        require(balance >= amount, "insufficient balance");

        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);

    }

    // Function to calculate interest for the caller
    function calculateInterest() public view returns (uint256) {
        // TODO: Implement interest calculation: (balance * interestRate / 100)

        require(interestRate>0,"interestRate need to be set");
        uint256 balance=balances[msg.sender];

        return (balance * interestRate / 100); // Replace this with the actual calculation
    }

    // Function for the owner to set the interest rate
    function setInterestRate(uint256 rate) public onlyOwner {
        require(rate > 0 && rate <= 100, "Interest rate must be between 1 and 100%");
        // TODO: Update the interestRate variable
        interestRate=rate;
    }

    // Function for the owner to withdraw all funds (administrative purpose)
    function withdrawAll() public onlyOwner {
        uint256 contractBalance = address(this).balance; // Get the contract's total balance
        // TODO: Transfer all Ether to the owner
        balances[owner] -= contractBalance;
        payable(owner).transfer(contractBalance);
    }

    // Function to check the balance of the caller
    function getBalance() public view returns (uint256) {
        return balances[msg.sender]; // Returns the balance of the caller
    }

    // Fallback function to handle direct Ether transfers
    receive() external payable {
        deposit(); // TODO: Call the deposit function when Ether is sent directly
    }
}
