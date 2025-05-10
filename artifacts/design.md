# Design of Piggyswap

Piggyswap is a token exchange app. User may swap a certain amount of a token in exchange for a certain amount of another token.  

## Usage specs
1. User connects a wallet.  
2. User chooses what token to swap in exchange for what token to receive.  
3. User sets amount of token to swap. App shows the reciprocal amount of token user may receive in return.  
4. User approves the swap.  
5. Per approved swap, amount of token to swap is withdrawn from wallet, and reciprocal amount of token to receive is deposited into wallet.  
6. App shows summary of the swap:  
    1. from and to addresses  
    2. date time  
    3. token types swapped  
    4. amounts swapped  
7. If user wants to perform another swap, go to step 2.  
   Else, user disconnects wallet.  
8. End.  

## Design specs
1. Every swap is atomic, or should be as atomic as possible.  
2. App must be able to handle at least 1000 users concurrently.  
3. App takes measures to manage slippage.  
4. App supports only a specific basket of token types.  
5. App publishes a live table showing the updated exchange rate of each supported token type.  
6. App maintains liquidity pools of each supported token type to facilitate swaps without requiring 3rd party counterparties.  
7. App stores record of each wallet that transacted on it and its history of transactions.  

## Architecture
WIP  
### Components
1. wallets  
2. app frontend  
3. app backend  
   1. liquidity pools  
   2. checks and validations  
   3. app state and data  
   4. logging and reporting  
4. security  
   as it applies to each component (ie: wallets, frontend, backend, etc) as well as to the app as a whole  

### Actors
1. User  
   Entity making use of app's functionality.  
   Multiple separate individual actors interacting with app concurrently.  
   Prone to delays, dropoffs, cancellations, etc.  
   Most concerned about ease of understanding, ease of use, speed of transaction, minimized slippage.  
2. Admin  
   Entity managing app operations, liquidity, and resources.  
   Ensures liquidity for each pool is adequate.  
   Handles app lapses/failures, security issues, attacks.  
   Most concerned with ensuring app's smooth operation, app security, protecting users' funds, protecting app funds.  

## Implementation specs

