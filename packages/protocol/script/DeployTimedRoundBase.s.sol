// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.17;

import {Script} from 'forge-std/Script.sol';
import {TimedRound} from '../contracts/ethereum/rounds/TimedRound.sol';

contract DeployTimedRoundBase is Script {
    address public immutable starknetCore;
    address public immutable propHouse;
    address public immutable messenger;
    address public immutable manager;

    uint256 public immutable timedRoundClashHash;
    uint256 public immutable roundFactoryAddress;
    uint256 public immutable executionRelayerAddress;


    constructor(
        address starknetCore_,
        address propHouse_,
        address messenger_,
        address manager_,
        uint256 timedRoundClashHash_,
        uint256 roundFactoryAddress_,
        uint256 executionRelayerAddress_
    ) {
        starknetCore = starknetCore_;
        propHouse = propHouse_;
        messenger = messenger_;
        manager = manager_;

        timedRoundClashHash = timedRoundClashHash_;
        roundFactoryAddress = roundFactoryAddress_;
        executionRelayerAddress = executionRelayerAddress_;
    }

    function run() public returns (address timedRound) {
        uint256 deployerKey = vm.envUint('DEPLOYER_PRIVATE_KEY');
        vm.startBroadcast(deployerKey);

        timedRound = address(new TimedRound(
            timedRoundClashHash,
            propHouse,
            starknetCore,
            messenger,
            roundFactoryAddress,
            executionRelayerAddress,
            manager
        ));
        vm.stopBroadcast();
    }
}
