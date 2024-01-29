import React, { useEffect, useState } from 'react';
import { Round, usePropHouse } from '@prophouse/sdk-react';
import Skeleton from 'react-loading-skeleton';

const PropHouseDataExample = () => {
  const propHouse = usePropHouse();

  const [rounds, setRounds] = useState<Round[] | undefined>();

  useEffect(() => {
    const fetch = async () => {
      setRounds(await propHouse.query.getRounds());
    };
    fetch();
  }, [propHouse.query]);

  return <>{rounds?.map((round) => <p>{round.title}</p>) || <Skeleton />}</>;
};

export default PropHouseDataExample;
