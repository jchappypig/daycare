class DropDiaries < ActiveRecord::Migration
  def up
    remove_column :stories, :diary_id, :integer
    drop_table :diaries
  end

  def down
    create_table :diaries do |t|
      t.timestamps
    end
    add_column :stories, :diary_id, :integer
  end
end
