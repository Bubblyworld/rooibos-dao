import React from "react";
import { newContextComponents } from "@drizzle/react-components";

const { AccountData, ContractForm } = newContextComponents;

export default function UserInfo({ drizzle, drizzleState }) {
  return (
    <div>
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
