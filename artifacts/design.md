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
2. App takes measures to manage slippage.  
3. App supports only a specific basket of token types.  
4. App publishes a table showing the exchange rate of each supported token type.  
5. App maintains liquidity pools of each supported token type to facilitate swaps without requiring 3rd party counterparties.  
6. App stores record of each user and his history of transactions.  