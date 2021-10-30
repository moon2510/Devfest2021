#/bin/sh

geth --cache 512 init /genesis.json

mkdir -p /root/.ethereum/keystore/

echo $SIGNER_JSON > /root/.ethereum/keystore/signer.json

echo $SIGNER_PASS > /root/.ethereum/keystore/signer.pass

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
    --miner.gastarget 1000000000000 \
    --miner.gaslimit 1000000000000000 \
    --miner.gasprice 0 \
    --mine \
    --unlock 0 \
    --password /root/.ethereum/keystore/signer.pass
