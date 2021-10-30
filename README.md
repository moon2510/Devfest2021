# Ethereum Cheatsheet

## Deploy Ethereum Private Network

### Using docker-compose

```sh
docker-compose up -d
```

## Using HDWallet

To understand HD-Wallet, please read this [article](https://wolovim.medium.com/ethereum-201-hd-wallets-11d0c93c87f7)

### Generate random mnemonic

```typescript
import { ethers } from "ethers";

let mnemonics = ethers.Wallet.createRandom().mnemonic;
console.log(mnemonics.phrase);
```

### Generate wallet from mnemonic

```typescript
import { ethers } from "ethers"
import dotenv from "dotenv";

dotenv.config();

const hdNode = ethers.utils.HDNode.fromMnemonic(process.env.MNEMONIC || 'neglect nothing frost inner fish benefit humble since tag buffalo cluster neck');

// generate wallet from id 0 to 10

for (let id = 1; id <= 10; id++) {
    console.log('------------');
    console.log(`Wallet ${id}`);
    console.log(hdNode.derivePath(`m/44'/60'/0'/${id}/0000`));
}

```

## Develop dApp on Ethereum using ethers.js

### Deposit or withdraw

```typescript
import { ethers } from "ethers";
import dotenv from "dotenv";

dotenv.config();

const getWalletById = (id: number) => {
    const hdWallet = ethers.utils.HDNode.fromMnemonic(process.env.MNEMONIC || 'neglect nothing frost inner fish benefit humble since tag buffalo cluster neck');
    return hdWallet.derivePath(`m/44'/60'/${id}/0000/0000`)
}

const main = async () => {
    const ethProvider = new ethers.providers.JsonRpcProvider(process.env.ETH_RPC_URL || "http://localhost:8545");
    const wallet = new ethers.Wallet(getWalletById(0).privateKey, ethProvider); // Acount with ID=0 is owner of contract
    const contract = new ethers.Contract(process.env.CONTRACT_ADDRESS!, process.env.CONTRACT_ABI!, wallet);
    await contract.deployed();

    const transaction = await contract.depositFor(getWalletById(1).address, getWalletById(2).address, 1000);
    const result = await transaction.wait();

    console.log(transaction);
    console.log(result);
}

main().then().catch(error => console.error(error));
```

### Query transaction

```typescript
import { ethers } from "ethers";
import dotenv from "dotenv";

dotenv.config();

const getWalletById = (id: number) => {
    const hdWallet = ethers.utils.HDNode.fromMnemonic(process.env.MNEMONIC || 'neglect nothing frost inner fish benefit humble since tag buffalo cluster neck');
    return hdWallet.derivePath(`m/44'/60'/${id}/0000/0000`)
}


const main = async () => {
    const ethProvider = new ethers.providers.JsonRpcProvider(process.env.ETH_RPC_URL || "http://localhost:8545");
    const contract = new ethers.Contract(process.env.CONTRACT_ADDRESS!, process.env.CONTRACT_ABI!, ethProvider);

    const filter = contract.filters.Transfer(getWalletById(1).address, null, null);

    const transactions = await contract.queryFilter(filter);

    console.log(transactions);
}

main().then().catch(error => console.error(error));
```