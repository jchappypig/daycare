class Story < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>', large: '400x400>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def self.find_by_date(date)
    self.where(created_at: date.beginning_of_day..date.end_of_day)
  end
end
