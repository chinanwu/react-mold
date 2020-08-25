import React from 'react';
import PropTypes from 'prop-types';

import './SampleComponent.less';

export const SampleComponent = () => (
  <div className="Test">Sample</div>
);

SampleComponent.propTypes = {
  test: PropTypes.string
};

export default SampleComponent;
