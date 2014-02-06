class AddPhotoToStories < ActiveRecord::Migration
  def change
    add_column :stories, :photo, :string
  end
end
