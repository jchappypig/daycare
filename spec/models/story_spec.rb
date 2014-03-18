require 'spec_helper'

describe Story do
  describe 'validate presence' do
    it {should validate_presence_of :content}
  end
end
