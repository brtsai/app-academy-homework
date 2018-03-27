import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  store.dispatch = addLoggingDispatch(store);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

function addLoggingDispatch(store) {
  const storeDispatch = store.dispatch;
  return (action) => {
    console.log(store.getState());
    console.log(action);
    storeDispatch(action);
    console.log(store.getState());
  };
}
