// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
import "./Blacksmith.sol";
import "../../../contracts/ethereum/mocks/MockERC721.sol";
contract MockERC721BS {
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
        MockERC721(proxiedContract).approve(to, tokenId);
    }

	function balanceOf(address owner) public  startPrank stop returns (uint256) {
        return MockERC721(proxiedContract).balanceOf(owner);
    }

	function burn(uint256 tokenId) public  startPrank stop  {
        MockERC721(proxiedContract).burn(tokenId);
    }

	function getApproved(uint256 tokenId) public  startPrank stop returns (address) {
        return MockERC721(proxiedContract).getApproved(tokenId);
    }

	function isApprovedForAll(address owner, address operator) public  startPrank stop returns (bool) {
        return MockERC721(proxiedContract).isApprovedForAll(owner, operator);
    }

	function mint(address to, uint256 tokenId) public  startPrank stop  {
        MockERC721(proxiedContract).mint(to, tokenId);
    }

	function name() public  startPrank stop returns (string memory) {
        return MockERC721(proxiedContract).name();
    }

	function ownerOf(uint256 tokenId) public  startPrank stop returns (address) {
        return MockERC721(proxiedContract).ownerOf(tokenId);
    }

	function safeMint(address to, uint256 tokenId, bytes memory data) public  startPrank stop  {
        MockERC721(proxiedContract).safeMint(to, tokenId, data);
    }

	function safeMint(address to, uint256 tokenId) public  startPrank stop  {
        MockERC721(proxiedContract).safeMint(to, tokenId);
    }

	function safeTransferFrom(address from, address to, uint256 tokenId) public  startPrank stop  {
        MockERC721(proxiedContract).safeTransferFrom(from, to, tokenId);
    }

	function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public  startPrank stop  {
        MockERC721(proxiedContract).safeTransferFrom(from, to, tokenId, data);
    }

	function setApprovalForAll(address operator, bool approved) public  startPrank stop  {
        MockERC721(proxiedContract).setApprovalForAll(operator, approved);
    }

	function supportsInterface(bytes4 interfaceId) public  startPrank stop returns (bool) {
        return MockERC721(proxiedContract).supportsInterface(interfaceId);
    }

	function symbol() public  startPrank stop returns (string memory) {
        return MockERC721(proxiedContract).symbol();
    }

	function tokenURI(uint256 tokenId) public  startPrank stop returns (string memory) {
        return MockERC721(proxiedContract).tokenURI(tokenId);
    }

	function transferFrom(address from, address to, uint256 tokenId) public  startPrank stop  {
        MockERC721(proxiedContract).transferFrom(from, to, tokenId);
    }
}
