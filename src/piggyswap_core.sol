// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract PiggyswapCore {
    // custom types //////////////////////////////////////////////////////
    // tokens
    struct TokenProfile {
        address token;                  // token address
        uint8 precision;
        string name;
        string symbol;
        string tokenType;               // eg: "ERC20", "ERC1363", "ERC1155", etc
        bytes4[] supportedInterfaces;   // list of supported ERC165 interfaces
        bytes description;              // short token description
    }
    struct TokenState {
        address pool;           // liquidity pool address
        uint256 totalBalance;   // current pool total balance
        uint256 availBalance;   // current pool balance available for swaps
        uint256 price;          // current token price in USD
        TokenStatus status;     // ie: ACTIVE, PAUSED, SUSPENDED, etc
    }
    enum TokenStatus {
        ACTIVE,
        PAUSED,
        SUSPENDED
    }

    // transactions
    struct AppTransaction {
        address wallet;
        address tokenOffered;
        address tokenRequested;
        uint256 amountOffered;
        uint256 amountRequested;
        uint256 datetime;
        TransactionStatus status;
    }
    enum TransactionStatus {
        PROPOSED,
        PENDING,
        CONFIRMED,
        REJECTED,
        SUSPENDED,
        CANCELLED
    }
    struct TxRecord {
        mapping(uint256 => AppTransaction) appTransactions;
        uint256 txCount;
    }

    // state variables ///////////////////////////////////////////////////
    // tokens
    mapping(address tokenAddr => bool isSupported) private supportedTokens;
    mapping(address tokenAddr => TokenProfile tokenProfile) private supportedTokensInfo;
    mapping(address tokenAddr => TokenState tokenState) private supportedTokensState;
    address[] private supportedTokensList;
    address[] private activeTokensList;
    address[] private pausedTokensList;
    address[] private suspendedTokensList;

    // wallets
    mapping(address walletAddr => bool transactedBefore) private walletPool;
    mapping(address walletAddr => TxRecord txHistory) private walletTxHistory;

    // transactions
    mapping(address tokenAddr => uint256 txAmountLimit) private tokenTxAmountLimit;

    // functions ////////////////////////////////////////////////////////
    constructor() {
    }
    function isTokenSupported(address tokenAddr) public view returns (bool) {
        return supportedTokens[tokenAddr];
    }
    function getSwapRate(address tokenOffered, address tokenRequested) public view returns (uint256) {
        uint8 precisionOffered = supportedTokensInfo[tokenOffered].precision;
        uint8 precisionRequested = supportedTokensInfo[tokenRequested].precision;
        uint8 precisionUsed = (precisionOffered > precisionRequested) ? precisionOffered : precisionRequested;
        return supportedTokensState[tokenOffered].price * 10**precisionUsed / 
            supportedTokensState[tokenRequested].price / 
            10**precisionUsed;
    }
    function proposeSwap(AppTransaction memory swapTx) public returns (bool) {
        // check transaction validity
        // 1. wallet is valid
        // 2. offered token and requested token are supported
        // 3. amount offered and amount requested > zero
        // 4. amount offered and amount requested <= swap limits
        // 5. amount offered <= wallet balance of offered token
        // 6. amount requested <= available pool balance of requested token

        // if transaction is valid, set status to PROPOSED
        // call performSwap()

        // if transaction is invalid, set status to REJECTED
        // return false
    }
    function performSwap(AppTransaction memory swapTx) internal returns (bool) {
        // depending on token types, call appropriate transfer functions to perform swap
        // return true if successful, else return false
    }
}