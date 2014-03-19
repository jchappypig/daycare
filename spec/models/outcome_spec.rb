require 'spec_helper'

describe Outcome do
  describe 'validate relationship' do
    it {should belong_to :story}
    it {should belong_to :outcome_item}

    describe 'between story and outcome_item' do
      before(:each) do
        @story = build(:story)
        outcome_item = OutcomeItem.create(item_no: '2_2')
        @outcome = Outcome.create(outcome_item: outcome_item);
        @story.outcomes << @outcome
      end

      it 'should be able to create a story with outcomes' do
        expect(@story.outcomes.size).to be 1
        expect(@story.outcomes.first.outcome_item.item_no).to eq '2_2'
      end

      it 'should be deleted if correspond story is deleted' do
        @story.destroy

        expect(Outcome.find_by(id: @outcome.id)).to be_nil
      end
    end

  end
end
