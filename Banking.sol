pragma solidity 0.8.14;

contract Banking{
    
    mapping(address => uint) private balances;

    function deposit() external payable{
        balances[msg.sender] += msg.value; 

    }

    function withdraw(address payable addr, uint amount) public payable{
        require(balances[addr] >= amount, "Insufficient balance");
        (bool sent, bytes memory data) = addr.call{value: amount}("");
        require(sent, "Not able to place the transaction");
        balances[msg.sender] -= amount;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}