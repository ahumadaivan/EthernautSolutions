// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SolveForce {
    constructor() payable {}

    function forcePayment(address _receiver) external {
        require(_receiver != address(0), "Direccion invalida");
        selfdestruct(payable(_receiver));
    }
}