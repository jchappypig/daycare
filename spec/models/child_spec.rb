require 'spec_helper'

describe Child do
  describe 'validate presence' do
    it {should validate_presence_of :first_name}
    it {should validate_presence_of :last_name}
    it {should validate_presence_of :dob}
  end

  describe 'age calculation' do
    let (:expected_age) {33}
    let (:expected_dob) {Date.today - expected_age.years}

    it 'should consider leopard year when calculate age' do
      child = build(:child, dob: expected_dob-1)
      child.age.should == expected_age-1
    end

    it 'should be able to calculate age' do
      child = build(:child, dob: expected_dob)
      child.age.should == expected_age
    end

  end
end
