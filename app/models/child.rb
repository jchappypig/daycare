class Child < ActiveRecord::Base
  belongs_to :group

  validates :first_name, :last_name, :dob, presence: true

  def age
    today = Date.today
    age = today.year - dob.year
    age -=1  if today > dob + age.years
    age
  end
end