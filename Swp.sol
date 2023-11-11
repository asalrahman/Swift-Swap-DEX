// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// create a own Swp token 

contract Swp is  ERC20, ERC20Burnable, Ownable  {

//errors

error  Swp_NotZeroAccount();
error Swp__AmountMustBeMoreThanZero();

//mappings

mapping (address user => uint256 token) public s_UserToAmountMined;


    constructor() ERC20("SwiftSwap", "Swp"){
    _mint(msg.sender, 1000000 * 10 ** 18);
    
    }


    //tresnfer to specific address
 function mint(address _to, uint256 _amount) private onlyOwner {
    if(_to == address(0)){
        revert Swp_NotZeroAccount();
    }
    if(_amount <=0){
   revert Swp__AmountMustBeMoreThanZero();
    }
      s_UserToAmountMined[_to] +=_amount;
        _mint(_to, _amount);
    }



    function reward(address)

//burn token
function burn(uint256 _amount) private onlyOwner {
    _burn(msg.sender, _amount);
    }
}

