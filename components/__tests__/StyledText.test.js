import { render, screen } from '@testing-library/react-native';
import * as React from 'react';

import { MonoText } from '../StyledText';

describe('<StyledText />', () => {
  it(`renders correctly`, async () => {
    await render(<MonoText>Snapshot test!</MonoText>);

    expect(screen.toJSON()).toMatchSnapshot();
  });
});
