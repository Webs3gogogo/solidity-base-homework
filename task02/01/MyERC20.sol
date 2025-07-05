// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./ICustomERC20.sol";

contract MyERC20 is CustomERC20 {
    //basic info
    string public constant name = "MyERC20";
    string public constant symbol = "MERC";
    uint256 public totalSupply;

    //合约所有者
    address public owner;

    //帐户余额映射
    mapping(address => uint256) public balanceMap;

    //帐号授权映射
    mapping(address => mapping(address => uint256)) public allowance;

    /*
     *  indexed 用于标记事件参数可以被高效地过滤（filter）和搜索。具体来说：
     *  可过滤性：标记为 indexed 的参数会被存入特殊的日志数据结构（称为 "topics"），允许外部应用（如前端或区块链浏览器）高效地过滤特定事件。
     *  非索引参数：没有 indexed 的参数会被存入日志的数据部分（data），无法直接过滤，但可以完整存储更复杂的数据。
     */
    event Transfer(address indexed _from, address indexed _to, uint256 amount);

    event Approval(
        address indexed _owner,
        address indexed spender,
        uint256 limit
    );

    constructor() {
        //将当前合约的部署地址赋值给合约创建者
        owner = msg.sender;
        //总供应量
        totalSupply = 100 ether;
        balanceMap[owner] = totalSupply;
        emit Transfer(address(0), owner, totalSupply);
    }

    function balanceOf(address _account)
        external
        view
        returns (uint256 balance)
    {
        return balanceMap[_account];
    }

    function transfer(address _to, uint256 amount) external {
        //判断动作发起者是否余额充足
        require(balanceMap[msg.sender] >= amount, "balance insufficient");
        balanceMap[msg.sender] -= amount;
        balanceMap[_to] += amount;
        emit Transfer(msg.sender, _to, amount);
    }

    function approve(address spender, uint256 value) external returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool) {
        require(balanceMap[from] >= value, "balance insufficient");
        require(allowance[from][msg.sender] >= value, "balance insufficient");
        allowance[from][msg.sender] -= value;
        balanceMap[from] -= value;
        balanceMap[to] += value;
        emit Transfer(from, to, value);
        return true;
    }

    modifier onwerable() {
        require(msg.sender == owner, "only for owner");
        _;
    }

    function mint(address _address, uint256 amount) public onwerable {
        require(_address != address(0), "invalid address");
        balanceMap[_address] += amount;
    }

        // 转移合约所有权
    function transferOwnership(address _newOwner) public onwerable {
        owner = _newOwner;
    }
}
