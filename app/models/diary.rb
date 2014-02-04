class Diary < ActiveRecord::Base
  has_many :stories
end
