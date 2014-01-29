class Child < ActiveRecord::Base
  self.table_name = 'children'

  belongs_to :group

  def age

  end
end