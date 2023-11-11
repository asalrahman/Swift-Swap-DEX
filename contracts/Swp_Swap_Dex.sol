// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.7;


import{SwpToken} from "./Swp.sol";

/*
swap contract

-ethTotoke
-tokenToeth
-tokenTotoken
*/
contract Swp_Swap_Dex is Swp{



function EthToToken() payable public{}

function TokenToEth()payable public{}

function TokenToToken()payable public{}

}