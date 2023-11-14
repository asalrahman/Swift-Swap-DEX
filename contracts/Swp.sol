// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity =0.7.6;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// create an own Swp token 
contract Swp is ERC20, Ownable {

    // errors
    // error Swp_NotZeroAccount();
    // error Swp_AmountMustBeMoreThanZero();

    // mappings
    mapping(address => uint256) public s_UserToAmountMined;
    mapping(address => uint256) public s_UserToRewardMined;

    constructor() public ERC20("SwiftSwap", "Swp") {
        _mint(msg.sender, 1000000 * 10 ** 18);
    }

    // transfer to a specific address
    function mint(address _to, uint256 _amount) public onlyOwner {
        require(_to != address(0), "Swp_NotZeroAccount");
        require(_amount > 0, "Swp_AmountMustBeMoreThanZero");
        s_UserToAmountMined[_to] += _amount;
        _mint(_to, _amount);
    }

    // burn token
    function burn(uint256 _amount) public onlyOwner {
        _burn(msg.sender, _amount);
    }

    // rewards
    function reward(address _recipient, uint256 _amount) public onlyOwner {
        require(_recipient != address(0), "Swp_NotZeroAccount");
        require(_amount > 0, "Swp_AmountMustBeMoreThanZero");
        s_UserToRewardMined[_recipient] += _amount;
        _mint(_recipient, _amount);
    }
}
