import { ChainId } from '@prophouse/sdk-react';

const CHAIN_ID_TO_INFURA_LABEL: Record<number, string> = {
  [ChainId.EthereumMainnet]: 'mainnet',
  [ChainId.EthereumGoerli]: 'goerli'
};

export const getInfuraChainLabel = (chainId: number) => {
  const label = CHAIN_ID_TO_INFURA_LABEL[chainId];
  if (!label) {
    throw new Error(`Unknown chainId: ${chainId}`);
  }
  return label;
};
