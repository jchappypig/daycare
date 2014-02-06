class Story < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  def self.find_by_date(date)
    self.where(created_at: date.beginning_of_day..date.end_of_day)
  end
end
