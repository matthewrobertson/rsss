class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :user_id
      t.integer :link_id
      t.boolean :is_read, :null => false, :default => false

      t.timestamps
    end
    add_index :stories, :link_id
    add_index :stories, :user_id
  end
end
