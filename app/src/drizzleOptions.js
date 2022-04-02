import Web3 from "web3";

import RooibosDao from "./contracts/RooibosDao.json";

const drizzleOptions = {
  web3: {
    block: false,
    customProvider: new Web3("ws://localhost:7545"),
  },
  contracts: [RooibosDao],
  events: {
    RooibosDao: ["RoleGranted"], // TODO: populate when we have events
  },
};

export default drizzleOptions;
