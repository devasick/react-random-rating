import React from 'react';
import ReactDOM from 'react-dom';
import Index from './Index';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<Index />, div);
  ReactDOM.unmountComponentAtNode(div);
});

 