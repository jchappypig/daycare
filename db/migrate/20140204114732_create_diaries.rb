class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|

      t.timestamps
    end
  end
end
