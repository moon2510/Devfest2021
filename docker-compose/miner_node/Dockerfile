FROM ethereum/client-go:latest

COPY genesis.json /genesis.json

COPY miner_node/entrypoint.sh /

COPY miner_node/node.key /

CMD ["/entrypoint.sh" ]

ENTRYPOINT [ "sh" ]