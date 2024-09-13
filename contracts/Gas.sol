// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract Gas {
    uint public i = 0;
    uint remained;

    function forever() public {
        while (true){
            if(i>100)return;
            if(i==10){
                remained = gasleft();
            }
            i+=1;
        }
    }
}

contract GasCaller{
    Gas private  gas;
    constructor(Gas _gas) {
        gas = _gas;
    }
    function callForever() public {
        gas.forever{gas:200000}();
    }
} 