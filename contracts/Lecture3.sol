// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// contract hotel{

//     // bool isbooked;

//     struct customerInfo{
//         address customer;
//         uint8 _days;
//     }

//     customerInfo _customer;

//     enum isbooked{yes, no}
//     isbooked booked;


//     function bookRoom(uint8 bookedDays) public {
        
//         _customer.customer = msg.sender;
//         _customer._days = bookedDays;
//         booked = isbooked.yes;
        
//     }

//     function getInformation() public view returns(customerInfo memory){
//         return _customer;
//     }
// }


// }

contract Balance{

    //Address1: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    //Address2: 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
    
    mapping(address => uint256) public balances;
    constructor(){}

    //Modifier To Recall Statement Everytime 
    modifier checkValue(){
        require(msg.value >= 1 ether, "Error");
        _;
    }

    event balanceIsSet(address);

    function setBalanceFixed() public payable checkValue{
        balances[payable(msg.sender)] = msg.value;
        emit balanceIsSet(msg.sender);
    }

    function getBalanceOfThis() public view returns (uint256){
        return balances[address(this)];
    }

    function setBalanceInput(address wallet, uint256 amount) public {
        require(amount >= 100, "Low Balance");
        require(wallet != address(0), "Zero Address Detected");
        balances[wallet] = amount;
    }

    function addBalance(address wallet) public {
        balances[wallet] += 100;
    }

    function transferBalance(address sender, address reciever, uint256 amount) public returns(bool) {
        balances[sender] -= amount;
        balances[reciever] += amount;
        return true;
    }
}