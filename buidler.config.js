usePlugin("@nomiclabs/buidler-truffle5");
usePlugin("buidler-gas-reporter");

module.exports = {
  solc: {
    version: '0.6.8',
    optimizer: { enabled: true },
  },
};
