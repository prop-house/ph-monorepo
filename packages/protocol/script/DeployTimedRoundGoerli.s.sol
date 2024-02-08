// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.17;

import {DeployTimedRoundBase} from './DeployTimedRoundBase.s.sol';

contract DeployTimedRoundGoerli is DeployTimedRoundBase {
    address public constant STARKNET_CORE = 0xde29d060D45901Fb19ED6C6e959EB22d8626708e;

    address public constant PROP_HOUSE = 0x7239D0226eD5BC323286c904D4d5A9c06b230048;
    address public constant MESSENGER = 0x83eC339CDaf39817ad2de608C7E626649463add5;
    address public constant MANAGER = 0x5d970884c7dBc8bD03e7a6CC20048B68FF3A52DE;

    uint256 public constant TIMED_ROUND_CLASH_HASH = 0x3dd59501890115a0c448df10d24b31059a7a28981046369311c0bb3019cd205;
    uint256 public constant ROUND_FACTORY_ADDRESS = 0x0013a01124554e76ac32af3d91bf47d2c2ea8432db7b9a16d0cd39d09bd65c6f;
    uint256 public constant EXECUTION_RELAYER_ADDRESS = 0x012ffaf50d64a5821b2d9d1ce2431cb3ca313eee7f8fcfa07ed1b79d38ab95be;

    constructor() DeployTimedRoundBase(
        STARKNET_CORE,
        PROP_HOUSE,
        MESSENGER,
        MANAGER,
        TIMED_ROUND_CLASH_HASH,
        ROUND_FACTORY_ADDRESS,
        EXECUTION_RELAYER_ADDRESS
    ) {}
}
