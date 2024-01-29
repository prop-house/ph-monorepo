// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
import "./Blacksmith.sol";
import "../../../contracts/ethereum/PropHouse.sol";
contract PropHouseBS {
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
    function approve(address to, uint256 tokenId) public  startPrank stop  {
        PropHouse(proxiedContract).approve(to, tokenId);
    }

	function balanceOf(address owner) public  startPrank stop returns (uint256) {
        return PropHouse(proxiedContract).balanceOf(owner);
    }

	function batchDepositTo(address payable round, Asset[] memory assets) public payable  startPrank stop  {
        PropHouse(proxiedContract).batchDepositTo{value: msg.value}(round, assets);
    }

	function contractURI() public  startPrank stop returns (string memory) {
        return PropHouse(proxiedContract).contractURI();
    }

	function createAndFundRoundOnExistingHouse(address house, IPropHouse.Round memory newRound, Asset[] memory assets) public payable  startPrank stop returns (address) {
        return PropHouse(proxiedContract).createAndFundRoundOnExistingHouse{value: msg.value}(house, newRound, assets);
    }

	function createAndFundRoundOnNewHouse(IPropHouse.House memory newHouse, IPropHouse.Round memory newRound, Asset[] memory assets) public payable  startPrank stop returns (address, address) {
        return PropHouse(proxiedContract).createAndFundRoundOnNewHouse{value: msg.value}(newHouse, newRound, assets);
    }

	function createHouse(IPropHouse.House memory newHouse) public  startPrank stop returns (address) {
        return PropHouse(proxiedContract).createHouse(newHouse);
    }

	function createRoundOnExistingHouse(address house, IPropHouse.Round memory newRound) public payable  startPrank stop returns (address) {
        return PropHouse(proxiedContract).createRoundOnExistingHouse{value: msg.value}(house, newRound);
    }

	function createRoundOnNewHouse(IPropHouse.House memory newHouse, IPropHouse.Round memory newRound) public payable  startPrank stop returns (address, address) {
        return PropHouse(proxiedContract).createRoundOnNewHouse{value: msg.value}(newHouse, newRound);
    }

	function depositTo(address payable round, Asset memory asset) public payable  startPrank stop  {
        PropHouse(proxiedContract).depositTo{value: msg.value}(round, asset);
    }

	function exists(uint256 tokenId) public  startPrank stop returns (bool) {
        return PropHouse(proxiedContract).exists(tokenId);
    }

	function getApproved(uint256 tokenId) public  startPrank stop returns (address) {
        return PropHouse(proxiedContract).getApproved(tokenId);
    }

	function isApprovedForAll(address owner, address operator) public  startPrank stop returns (bool) {
        return PropHouse(proxiedContract).isApprovedForAll(owner, operator);
    }

	function isHouse(address house) public  startPrank stop returns (bool) {
        return PropHouse(proxiedContract).isHouse(house);
    }

	function isRound(address round) public  startPrank stop returns (bool) {
        return PropHouse(proxiedContract).isRound(round);
    }

	function manager() public  startPrank stop returns (IManager) {
        return PropHouse(proxiedContract).manager();
    }

	function name() public  startPrank stop returns (string memory) {
        return PropHouse(proxiedContract).name();
    }

	function ownerOf(uint256 tokenId) public  startPrank stop returns (address) {
        return PropHouse(proxiedContract).ownerOf(tokenId);
    }

	function safeTransferFrom(address from, address to, uint256 tokenId) public  startPrank stop  {
        PropHouse(proxiedContract).safeTransferFrom(from, to, tokenId);
    }

	function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public  startPrank stop  {
        PropHouse(proxiedContract).safeTransferFrom(from, to, tokenId, data);
    }

	function setApprovalForAll(address operator, bool approved) public  startPrank stop  {
        PropHouse(proxiedContract).setApprovalForAll(operator, approved);
    }

	function supportsInterface(bytes4 interfaceId) public  startPrank stop returns (bool) {
        return PropHouse(proxiedContract).supportsInterface(interfaceId);
    }

	function symbol() public  startPrank stop returns (string memory) {
        return PropHouse(proxiedContract).symbol();
    }

	function tokenURI(uint256 tokenId) public  startPrank stop returns (string memory) {
        return PropHouse(proxiedContract).tokenURI(tokenId);
    }

	function transferFrom(address from, address to, uint256 tokenId) public  startPrank stop  {
        PropHouse(proxiedContract).transferFrom(from, to, tokenId);
    }
}
