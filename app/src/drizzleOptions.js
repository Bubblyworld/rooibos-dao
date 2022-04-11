import Web3 from "web3";

import RooibosDao from "./contracts/RooibosDao.json";

const drizzleOptions = {
  web3: {
    block: false,
    customProvider: new Web3(Web3.givenProvider),
  },
  contracts: [RooibosDao],
  events: {
    RooibosDao: [], // TODO: populate when we have events
  },
};

export default drizzleOptions;
