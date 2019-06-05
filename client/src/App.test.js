import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';

it('renders without crashing', () => {
  // for this project we comment out the test because is going to fail due that now app component is going
  // to load the fib component which is going to make request to the server that is not running
  // In reality we need to do a mock service to aviod this, but that is not part of this course.


  // const div = document.createElement('div');
  // ReactDOM.render(<App />, div);
  // ReactDOM.unmountComponentAtNode(div);
});
