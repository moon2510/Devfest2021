#/bin/sh

geth --cache 512 init /genesis.json

mkdir -p /root/.ethereum/keystore/

echo "" > password.txt

geth account new --password password.txt

geth --networkid ${NETWORK_ID} \
    --cache 512 \
    --port 30303 \
    --maxpeers 512 \
    --light.maxpeers=256 \
    --light.serve=50 \
    --nodekey node.key \
    --ethstats "${ETH_STATS}" \
    --bootnodes "$BOOT_NODES" \
    --syncmode "full" \
    --unlock 0 \
    --miner.gastarget 0 \
    --miner.gaslimit 0 \
    --miner.gasprice 0 \
    --http \
    --http.addr '0.0.0.0' \
    --http.port 8545 \
    --http.api personal,eth,net,web3 \
    --http.corsdomain '*' \
    --password password.txt \
    --allow-insecure-unlock
