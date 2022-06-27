import { Meta } from '@/layouts/Meta';
import { Main } from '@/templates/Main';

const Index = () => {
  return (
    <Main
      meta={
        <Meta
          title="CoyCoding"
          description="Currently just messing around with the site"
        />
      }
    >
      <h1>Just messing around with Next.js boilerplate</h1>
    </Main>
  );
};

export default Index;
