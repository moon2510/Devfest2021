FROM ethereum/client-go:latest

COPY genesis.json /genesis.json

COPY boot_node/entrypoint.sh /entrypoint.sh

COPY boot_node/node.key /

CMD ["/entrypoint.sh" ]

ENTRYPOINT [ "sh" ]