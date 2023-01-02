require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config({ path: ".env" });

const URL = "https://alfajores-forno.celo-testnet.org";
const privateKey = "";
console.log(URL,privateKey);

module.exports = {
  solidity: "0.8.17",
  networks: {
    celoTestnet: {
      url: URL,
      accounts: [privateKey],
    },
    alfajores: {
      url: "https://alfajores-forno.celo-testnet.org",
      accounts: {
        mnemonic: privateKey,
        path: "m/44'/52752'/0'/0"
      },
      chainId: 44787
    }
  },
};
