class CreateOutcomeItems < ActiveRecord::Migration
  def change
    create_table :outcome_items do |t|
      t.string :item_no
      t.string :description
      t.string :category
    end
  end
end
