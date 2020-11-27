// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.6.0;

library ChainId {
    function chainId() internal pure returns (uint256 id) {
        assembly {
            id := chainid()
        }
    }
}

library DomainSeparator {
    function domainSeparator(uint256 chainId) internal view returns (bytes32) {
        return keccak256(
            abi.encode(
                keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"),
                keccak256("Name"),
                keccak256(bytes("1")),
                chainId,
                address(this)
            )
        );
    }
}

contract BaselineEmpty {
    function getDomainSeparator() public returns (bytes32 b) {
    }
}

contract Storage {
    mapping (uint256 => bytes32) private _domainSeparators;

    constructor() public {
        _updateDomainSeparator();
    }

    function getDomainSeparator() public returns (bytes32) {
        bytes32 domainSeparator = _domainSeparators[ChainId.chainId()];
        if (domainSeparator != 0x00) {
            return domainSeparator;
        } else {
            return _updateDomainSeparator();
        }
    }

    function _updateDomainSeparator() private returns (bytes32) {
        uint256 chainId = ChainId.chainId();
        bytes32 newDomainSeparator = DomainSeparator.domainSeparator(chainId);
        _domainSeparators[chainId] = newDomainSeparator;
        return newDomainSeparator;
    }
}

contract Keccak {
    constructor() public {
    }

    function getDomainSeparator() public returns (bytes32) {
        return DomainSeparator.domainSeparator(ChainId.chainId());
    }
}

contract Immutable {
    bytes32 immutable domainSeparator;

    constructor() public {
        domainSeparator = DomainSeparator.domainSeparator(ChainId.chainId());
    }

    function getDomainSeparator() public returns (bytes32) {
        return domainSeparator;
    }
}

contract KeccakPlusImmutable {
    uint256 immutable chainId;
    bytes32 immutable domainSeparator;

    constructor() public {
        chainId = ChainId.chainId();
        domainSeparator = DomainSeparator.domainSeparator(ChainId.chainId());
    }

    function getDomainSeparator() public returns (bytes32) {
        if (chainId == ChainId.chainId()) {
            return domainSeparator;
        } else {
            return DomainSeparator.domainSeparator(ChainId.chainId());
        }
    }
}

