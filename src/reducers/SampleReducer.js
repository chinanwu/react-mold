import { handleActions } from 'redux-actions';

import { editSample } from '../actions/SampleActions';

export const defaultState = {
  sample: "test"
};

export default handleActions(
  {
    [editSample]: (state, { payload }) => ({
      ...state,
      sample: payload,
    }),
  },
  defaultState
);
