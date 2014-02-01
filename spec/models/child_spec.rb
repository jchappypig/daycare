require 'spec_helper'

describe Child do
  describe 'validate presence' do
    it {should validate_presence_of :first_name}
    it {should validate_presence_of :last_name}
    it {should validate_presence_of :dob}
  end

  describe 'age' do
    it 'should consider leopard year when calculate age' do
      child = build(:child, dob: 33.years.ago.to_date-1)
      child.age.should == 32
    end

    it 'should be able to calculate age' do
      child = build(:child, dob: 33.years.ago.to_date)
      child.age.should == 33
    end

  end
end
