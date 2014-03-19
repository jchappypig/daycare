class CreateOutcomes < ActiveRecord::Migration
  def change
    create_table :outcomes do |t|
      t.string :story_id
      t.string :outcome_item_id
    end
  end
end
