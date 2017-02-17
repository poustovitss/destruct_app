require File.expand_path 'spec/spec_helper'

describe 'Application Controller' do
  describe 'GET index page' do
    it 'should allow accessing the home page' do
      get '/'
      expect(last_response.status).to eq 200
    end
  end

  describe 'POST create message' do
    context 'with valid attributes' do
      it 'creates a new message'
    end

    context 'with invalid attributes' do

    end
  end

  describe 'GET show message' do
    it 'assigns the requested message to @message'
  end
end