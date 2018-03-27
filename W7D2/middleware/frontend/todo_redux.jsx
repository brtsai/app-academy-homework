import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

const addLoggingToDispatch = store => next => action => {
  // your code here
    console.log(store.getState());
    console.log(action);
    next(action);
    console.log(store.getState());
};

const applyMiddlewares = (store, ...middlewares) => {
  let dispatch = store.dispatch;
  for(let i = 0; i < middlewares.length; i++) {
    dispatch = middlewares[i](store)(dispatch);
  }

  return Object.assign({}, store, { dispatch });
};
