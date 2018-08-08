#!/bin/bash
echo "generate 100 blocks from miner1 "
docker exec -it syscoin_miner_1 syscoin-cli -regtest generate 100
echo "check miner1 block counts"
docker exec -it syscoin_miner1_1 syscoin-cli -regtest getblockcount
echo "check node1 block counts"
docker exec -it syscoin_node1_1 syscoin-cli -regtest getblockcount
