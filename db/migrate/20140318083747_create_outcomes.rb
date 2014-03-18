class CreateOutcomes < ActiveRecord::Migration
  def change
    create_table :outcomes do |t|
      t.string :item_no
      t.string :description
    end
  end
end
