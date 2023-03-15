require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const URL = "https://alfajores-forno.celo-testnet.org";
const privateKey = process.env.PRIVATE_KEY;
const PolyscanApiKey = process.env.POLYSCAN_APIKEY;

module.exports = {
  solidity: {
    version: "0.8.10",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    },
  },
  networks: {
    alfajores: {
      url: "https://alfajores-forno.celo-testnet.org",
      accounts: [privateKey],
      chainId: 44787,
    },
    Mumbai: {
      url: Process.env.MUMBAI_URL,
      chainId: 80001,
      gasPrice: 80000,
      accounts: [ process.env.MUMBAI_MNEMONIC]
    }
  },
  etherscan: {
    apiKey: PolyscanApiKey
  },
    
  customChains: [
      {
        network: "alfajores",
        chainId: 44787,
        urls: {
          apiURL: "https://api-alfajores.celoscan.io/api",
          browserURL: "https://alfajores.celoscan.io",
        },
      },
    ],
};
