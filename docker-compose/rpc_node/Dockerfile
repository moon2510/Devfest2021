FROM ethereum/client-go:latest

COPY genesis.json /genesis.json

COPY rpc_node/entrypoint.sh /entrypoint.sh

COPY rpc_node/node.key /

CMD ["/entrypoint.sh" ]

ENTRYPOINT [ "sh" ]
