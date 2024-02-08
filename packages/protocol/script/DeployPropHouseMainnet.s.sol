// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.17;

import {DeployPropHouseBase} from './DeployPropHouseBase.s.sol';

contract DeployPropHouseMainnet is DeployPropHouseBase {
    address public constant STARKNET_CORE = 0xc662c410C0ECf747543f5bA90660f6ABeBD9C8c4;

    constructor() DeployPropHouseBase(STARKNET_CORE) {}
}
