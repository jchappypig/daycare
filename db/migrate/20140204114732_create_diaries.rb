class CreateDiaries < ActiveRecord::Migration
  def up
    create_table :diaries do |t|

      t.timestamps
    end
  end

  def down
    drop_table :diaries
  end
end
