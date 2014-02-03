class AddAttachmentPhotoToStories < ActiveRecord::Migration
  def self.up
    change_table :stories do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :stories, :photo
  end
end
