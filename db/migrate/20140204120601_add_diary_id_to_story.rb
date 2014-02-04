class AddDiaryIdToStory < ActiveRecord::Migration
  def change
    add_column :stories, :diary_id, :integer
  end
end
