class Outcome < ActiveRecord::Base
  has_one :outcome_item
  belongs_to :story
end
