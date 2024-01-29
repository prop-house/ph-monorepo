import React, { useEffect, useState } from 'react';
import PropHouseDataExample from '../components/Examples/PropHouseDataExample';
import type { NextPage } from 'next';
import { useNetwork } from 'wagmi';

const Home: NextPage = () => {
  const [chainId, setChainId] = useState<number>(1);
  const { chain } = useNetwork();

  useEffect(() => {
    if (chain) {
      setChainId(chain.id);
    }
  }, [chain]);

  return (
    <>
      <h2 className="text-2xl">
        <span>Prop House Rounds (Chain ID: {chainId})</span>
      </h2>

      <PropHouseDataExample />
    </>
  );
};

export default Home;
