import React, {useState, useEffect} from "react";
import { newContextComponents } from "@drizzle/react-components";

const { AccountData, ContractForm } = newContextComponents;

// Function to connect Metamask account to Web3
//https://metaschool.so/courses/add-metamask-connect-button-to-your-react-app/lesson/decc2d1a-ad8a-48f7-9c29-38a70b654477
function ConnectMetamask() {
  const [isWalletInstalled, setIsWalletInstalled] = useState(false);
  // state for keeping track of current connected account.
	const [account, setAccount] = useState(null);

  useEffect(() => {
		if (window.ethereum) {
			setIsWalletInstalled(true);
		}
	}, []);

  async function connectWallet() {
		  window.ethereum.request({
				method: "eth_requestAccounts",
			}).then((accounts) => {
				setAccount(accounts[0]);
			}).catch((error) => {
				alert("Something went wrong");
			});
	  }

    if (account === null) {
      return (
        <div className="App">
          { 
            isWalletInstalled ? (
              <button onClick={connectWallet}>Connect Wallet</button>
            ) : (
              <p>Install Metamask wallet</p>
            )
          }

        </div>
      );
    }
      return (
        <div className="App"> 
          <p>Connected as: {account}</p>
        </div>
    ); 
  }

export default function UserInfo({ drizzle, drizzleState }) {
  return (

    <div>
      <div className="connection">
        <ConnectMetamask/>
      </div>
      <div className="section">
        <h2>Account</h2>
        <AccountData
          drizzle={drizzle}
          drizzleState={drizzleState}
          accountIndex={0}
          units="ether"
          precision={3}
        />
      </div>

      <div className="section">
        <h2>Become Proposer</h2>
        <ContractForm
          drizzle={drizzle}
          drizzleState={drizzleState}
          method={"makeProposer"}
          labels={["Address"]}
          contract={"RooibosDao"}
        />
      </div>
    </div>
  );
};