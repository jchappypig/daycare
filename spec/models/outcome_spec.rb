require 'spec_helper'

describe Outcome do
  describe 'validate relationship' do
    it {should belong_to :story}
    it {should belong_to :outcome_item}

    it 'should be able to create a story with outcomes' do
      story = build(:story)
      outcome_item = OutcomeItem.create(item_no: '2_2')
      outcome = Outcome.create(outcome_item: outcome_item);
      story.outcomes << outcome

      expect(story.outcomes.size).to be 1
      expect(story.outcomes.first.outcome_item.item_no).to eq '2_2'
    end
  end
end
