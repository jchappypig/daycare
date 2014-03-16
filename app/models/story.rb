class Story < ActiveRecord::Base
  has_attachments :photos, maximum: 10

  def self.find_by_date(date)
    self.where(created_at: date.beginning_of_day..date.end_of_day)
  end
end
