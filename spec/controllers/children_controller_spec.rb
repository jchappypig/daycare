require 'spec_helper'

describe ChildrenController do
  describe 'GET#index' do
    it 'should render successfully' do
      get :index
      response.should be_successful
    end
  end

  describe 'GET#index' do
    it 'should render successfully' do
      get :index
      response.should be_successful
    end
  end
end
