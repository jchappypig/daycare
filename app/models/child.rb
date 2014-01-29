class Child < ActiveRecord::Base
  belongs_to :group

  validates :first_name, :last_name, :dob, presence: true

  def age

  end
end