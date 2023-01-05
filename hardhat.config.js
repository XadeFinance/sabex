require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const URL = "https://alfajores-forno.celo-testnet.org";
const privateKey = process.env.PRIVATE_KEY;
const celoscanApiKey = process.env.CELOSCAN_API_KEY;

// const privateKey = "";
// console.log(URL, privateKey);

module.exports = {
  solidity: "0.8.10",
  networks: {
    celoTestnet: {
      url: URL,
      accounts: [privateKey],
    },
    alfajores: {
      url: "https://alfajores-forno.celo-testnet.org",
      accounts: [privateKey],
      chainId: 44787,
    },
  },
  etherscan: {
    apiKey: {
      alfajores: celoscanApiKey,
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
  },
};
