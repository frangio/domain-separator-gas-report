Costs obtained using `eth-gas-reporter`.

- Solc version: 0.6.8
- Optimizer enabled: true
- Runs: 200
- Block limit: 9500000 gas

Note: Contracts with an asterisk are not complete implementations.

| Contract             |  Method              |  Avg        |  # calls     |
|----------------------|----------------------|-------------|---------------
| BaselineEmpty *      |  getDomainSeparator  |      21240  |           1  |
| Immutable *          |  getDomainSeparator  |      21240  |           1  |
| KeccakPlusImmutable  |  getDomainSeparator  |      21308  |           1  |
| KeccakPlusCache *    |  getDomainSeparator  |      21534  |           1  |
| Keccak *             |  getDomainSeparator  |      21798  |           1  |
| Storage              |  getDomainSeparator  |      22197  |           1  |

| Deployments                                 |  Avg        |  % of limit  |
|---------------------------------------------|-------------|---------------
| BaselineEmpty *                             |      81083  |       0.9 %  |
| KeccakPlusCache *                           |     121234  |       1.3 %  |
| Keccak *                                    |     140637  |       1.5 %  |
| Immutable *                                 |     148559  |       1.6 %  |
| KeccakPlusImmutable                         |     164659  |       1.7 %  |
| Storage                                     |     185252  |         2 %  |
