// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract Logic{
    uint public count;
    function inc() external {
        count+=1;
    }
}

contract UnstructureProxy{
    bytes32 private constant logicPosition = keccak256("org.zeppelinos.proxy.implementaion");
    function upgradeTo(address newLogic) public {
        setLogic(newLogic);
    }
    function logic() public view returns (address impl){
        bytes32 position = logicPosition;
        assembly{
            impl:=sload(position)
        }
    }
    function setLogic(address newLogic) internal {
        bytes32 position = logicPosition;
        assembly{
            sstore(position,newLogic)
        }
    }

    // user interface
    function _delegate(address _logic) internal  virtual {
        assembly{
           calldatacopy(0,0,calldatasize()) // copy calldata拷贝到内存中

           let result:=delegatecall(gas(),_logic,0,calldatasize(),0,0)
           returndatacopy(0,0,returndatasize())
            switch result
            case 0{
                revert(0,returndatasize())
            }
            default {
                return(0,returndatasize())
            }
        }
    }
}