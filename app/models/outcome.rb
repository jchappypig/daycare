class Outcome < ActiveRecord::Base
  belongs_to :outcome_item
  belongs_to :story
end
