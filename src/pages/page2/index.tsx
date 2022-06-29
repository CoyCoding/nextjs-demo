import { useRouter } from 'next/router';

import { Meta } from '@/layouts/Meta';
import { Main } from '@/templates/Main';

const Page1 = () => {
  const router = useRouter();
  console.log(router);
  return (
    <Main meta={<Meta title="Lorem ipsum" description="Lorem ipsum" />}>
      <div>This is page 2 the real route is shown in console</div>
    </Main>
  );
};

export default Page1;
