// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.17;

import {DeployPropHouseBase} from './DeployPropHouseBase.s.sol';

contract DeployPropHouseGoerli is DeployPropHouseBase {
    address public constant STARKNET_CORE = 0xde29d060D45901Fb19ED6C6e959EB22d8626708e;

    constructor() DeployPropHouseBase(STARKNET_CORE) {}
}
