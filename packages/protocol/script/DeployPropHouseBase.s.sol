// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.17;

import {Script} from 'forge-std/Script.sol';
import {Manager} from '../contracts/ethereum/Manager.sol';
import {PropHouse} from '../contracts/ethereum/PropHouse.sol';
import {CreatorPassIssuer} from '../contracts/ethereum/CreatorPassIssuer.sol';
import {StarknetCommit} from '../contracts/ethereum/StarknetCommit.sol';
import {CommunityHouse} from '../contracts/ethereum/houses/CommunityHouse.sol';
import {Messenger} from '../contracts/ethereum/Messenger.sol';

import {MetadataEncoder} from '../contracts/ethereum/renderers/encoders/MetadataEncoder.sol';
import {AssetMetadataRenderer} from '../contracts/ethereum/renderers/AssetMetadataRenderer.sol';
import {CommunityHouseMetadataRenderer} from '../contracts/ethereum/renderers/CommunityHouseMetadataRenderer.sol';
import {PropHouseMetadataRenderer} from '../contracts/ethereum/renderers/PropHouseMetadataRenderer.sol';

struct Deployment {
    address propHouse;
    address manager;
    address creatorPassIssuer;
    address messenger;
    address starknetCommit;
    address communityHouse;
    address metadataEncoder;
    address assetMetadataRenderer;
    address communityHouseMetadataRenderer;
    address propHouseMetadataRenderer;
}

contract DeployPropHouseBase is Script {
    address public immutable starknetCore;

    constructor(address starknetCore_) {
        starknetCore = starknetCore_;
    }

    function run() public returns (Deployment memory deployment) {
        uint256 deployerKey = vm.envUint('DEPLOYER_PRIVATE_KEY');
        vm.startBroadcast(deployerKey);

        deployment.metadataEncoder = address(new MetadataEncoder());
        deployment.assetMetadataRenderer = address(
            new AssetMetadataRenderer(deployment.metadataEncoder)
        );
        deployment.communityHouseMetadataRenderer = address(
            new CommunityHouseMetadataRenderer(deployment.metadataEncoder)
        );
        deployment.propHouseMetadataRenderer = address(
            new PropHouseMetadataRenderer()
        );
        deployment.manager = address(new Manager());
        deployment.propHouse = address(new PropHouse(deployment.manager));
        deployment.creatorPassIssuer = address(new CreatorPassIssuer(
            deployment.propHouse,
            deployment.manager
        ));
        deployment.messenger = address(new Messenger(starknetCore, deployment.propHouse));

        deployment.starknetCommit = address(new StarknetCommit(starknetCore));
        deployment.communityHouse = address(new CommunityHouse(
            deployment.propHouse,
            deployment.manager,
            deployment.creatorPassIssuer
        ));

        vm.stopBroadcast();
    }
}
