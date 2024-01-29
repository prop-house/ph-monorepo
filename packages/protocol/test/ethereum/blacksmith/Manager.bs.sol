// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
import "./Blacksmith.sol";
import "../../../contracts/ethereum/Manager.sol";
contract ManagerBS {
    Bsvm constant bsvm = Bsvm(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);
    address addr;
    uint256 privateKey;
    address payable proxiedContract;

    constructor( address _addr, uint256 _privateKey, address _target) {
        addr = _privateKey == 0 ? _addr : bsvm.addr(_privateKey);
        privateKey = _privateKey;
        proxiedContract = payable(_target);
    }
    modifier prank() {
        bsvm.prank(addr,addr);
        _;
    }
    modifier startPrank() {
        bsvm.startPrank(addr,addr);
        _;
    }
    modifier stop(){
        _;
        bsvm.stopPrank();
    }
    function proxyContract() external view returns (address) {
        return proxiedContract;
    }
    function acceptOwnership() public  startPrank stop  {
        Manager(proxiedContract).acceptOwnership();
    }

	function cancelOwnershipTransfer() public  startPrank stop  {
        Manager(proxiedContract).cancelOwnershipTransfer();
    }

	function getMetadataRenderer(address contract_) public  startPrank stop returns (ITokenMetadataRenderer) {
        return Manager(proxiedContract).getMetadataRenderer(contract_);
    }

	function getSecurityCouncil() public  startPrank stop returns (address) {
        return Manager(proxiedContract).getSecurityCouncil();
    }

	function isHouseRegistered(address houseImpl) public  startPrank stop returns (bool) {
        return Manager(proxiedContract).isHouseRegistered(houseImpl);
    }

	function isRoundRegistered(address houseImpl, address roundImpl) public  startPrank stop returns (bool) {
        return Manager(proxiedContract).isRoundRegistered(houseImpl, roundImpl);
    }

	function owner() public  startPrank stop returns (address) {
        return Manager(proxiedContract).owner();
    }

	function pendingOwner() public  startPrank stop returns (address) {
        return Manager(proxiedContract).pendingOwner();
    }

	function registerHouse(address houseImpl) public  startPrank stop  {
        Manager(proxiedContract).registerHouse(houseImpl);
    }

	function registerRound(address houseImpl, address roundImpl) public  startPrank stop  {
        Manager(proxiedContract).registerRound(houseImpl, roundImpl);
    }

	function safeTransferOwnership(address newOwner) public  startPrank stop  {
        Manager(proxiedContract).safeTransferOwnership(newOwner);
    }

	function setMetadataRenderer(address contract_, address renderer) public  startPrank stop  {
        Manager(proxiedContract).setMetadataRenderer(contract_, renderer);
    }

	function setSecurityCouncil(address newSecurityCouncil) public  startPrank stop  {
        Manager(proxiedContract).setSecurityCouncil(newSecurityCouncil);
    }

	function transferOwnership(address newOwner) public  startPrank stop  {
        Manager(proxiedContract).transferOwnership(newOwner);
    }

	function unregisterHouse(address houseImpl) public  startPrank stop  {
        Manager(proxiedContract).unregisterHouse(houseImpl);
    }

	function unregisterRound(address houseImpl, address roundImpl) public  startPrank stop  {
        Manager(proxiedContract).unregisterRound(houseImpl, roundImpl);
    }
}
