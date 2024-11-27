# Decentralized Lending Protocol

## Overview  
A secure, transparent lending protocol built on the Stacks blockchain using Clarity smart contracts.

---

## Features  
- **Collateral Deposit and Management**: Securely manage user deposits and withdrawals.  
- **Loan Issuance with Collateral Requirements**: Issue loans based on predefined collateral thresholds.  
- **Automatic Collateral Liquidation**: Automatically liquidate under-collateralized positions.  
- **Flexible Loan Repayment**: Support for variable repayment schedules.

---

## Contract Architecture  

1. **`collateral.clar`**: Manages user collateral deposits and withdrawals.  
2. **`issuance.clar`**: Handles loan origination with collateral checks.  
3. **`liquidation.clar`**: Manages liquidation for under-collateralized loans.  
4. **`repayment.clar`**: Tracks and processes loan repayments.
5. **`interest.clar`**: Calculates loan interests.


## Development Setup  

### Installation  
```bash
npm install
```

### Run Tests  
```bash
npm test
```

## Testing  
Comprehensive test coverage using **Vitest**, including mock implementations of Clarity contract logic.


## Security Considerations  
- **Minimum Collateral Requirements**: Ensures adequate backing for loans.  
- **Liquidation Mechanism**: Protects protocol solvency.  
- **Error Handling**: Covers invalid transactions.


## Roadmap  
1. Develop an interest rate model.  
2. Introduce advanced risk management mechanisms.  
3. Enable cross-contract interactions.


## Contributing  
Please read the `CONTRIBUTING.md` file for details on the code of conduct and the process for submitting pull requests.


## License  
This project is licensed under the **MIT License**.