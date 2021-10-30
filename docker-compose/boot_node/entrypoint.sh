#/bin/sh

geth --cache 512 init /genesis.json

exec geth --networkid ${NETWORK_ID} \
    --cache 512 \
    --port 30303 \
    --maxpeers 512 \
    --light.maxpeers=256 \
    --light.serve=50 \
    --nodekey node.key \
    --ethstats "${ETH_STATS}" \
    --miner.gastarget 0 \
    --miner.gaslimit 0 \
    --miner.gasprice 0
