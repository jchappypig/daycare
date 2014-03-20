require 'spec_helper'

describe ApplicationController do
  describe 'GET diaries' do
    before { get :diaries }

    it { should respond_with 200 }
    it { should render_template :diaries }
  end

  describe 'GET contact us' do
    before { get :contact_us }

    it { should respond_with 200 }
    it { should render_template :contact_us }
  end
end
