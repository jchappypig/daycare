class RenameColumnPhotoToPhotosInStories < ActiveRecord::Migration
  def change
    rename_column :stories, :photo, :photos
  end
end
