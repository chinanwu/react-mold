#!/bin/bash
NAME=$1
PATH=$2
FILENAME=${NAME}-test.js
if [ ! -f $FILENAME ]
then
	echo "import React from 'react';
import {shallow} from 'enzyme';
import {$NAME, mapStateToProps} from '../../src/$PATH/$NAME';
jest.unmock('../../src/$PATH/$NAME');
describe('$NAME', () => {
	describe('rendering', () => {
		it('renders expected elements', () => {
			const wrapper = shallow(<$NAME />);
			expect(wrapper.getElement()).toMatchSnapshot();
		});
	});
	describe('mapStateToProps', () => {
		it('returns mapped properties', () => {
			const state = {foo: 'test'};
			expect(mapStateToProps({state})).toEqual({state});
		});
	});
});" > $FILENAME
else
	echo File $FILENAME exists
fi
