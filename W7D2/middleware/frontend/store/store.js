import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState, applyMiddleware(addLoggingToDispatch, addMoreLoggingToDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

const addLoggingToDispatch = store => next => action => {
    console.log(store.getState());
    console.log(action);
    console.log(next);
    next(action);
    console.log(store.getState());
};

const addMoreLoggingToDispatch = store => next => action => {
  console.log(next);
  next(action);
}

export default configureStore;
