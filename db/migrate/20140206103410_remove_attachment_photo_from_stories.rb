class RemoveAttachmentPhotoFromStories < ActiveRecord::Migration
  def self.up
    drop_attached_file :stories, :photo
  end

  def self.down
    change_table :stories do |t|
      t.attachment :photo
    end
  end
end
