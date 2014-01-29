class CreateChild < ActiveRecord::Migration
  def change
    create_table :children do |f|
      f.string :first_name
      f.string :last_name
      f.date :dob
      f.button :submit
    end
  end
end
