// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Parent {
    string name;

    constructor(string memory paramName) {
        name = paramName;
    }

    function setName(string memory paramName) public virtual {
        name = paramName;
    }

    function getName() public pure virtual returns (string memory) {
        return "I am your father";
    }

    function saySomething() public pure returns (string memory) {
        return "I am your father";
    }
}

contract Child is Parent {
    string childname;

    constructor(string memory cname) Parent(cname) {
        // 子合约构造函数代码
        childname = cname;
    }

    function setName(string memory paramName) public override {
        name = paramName;
    }

    function getName() public pure override returns (string memory) {
        return string.concat(super.getName(), "I am your son");
    }

    function getChildname() public view returns(string memory) {
        return childname;
    }

}
