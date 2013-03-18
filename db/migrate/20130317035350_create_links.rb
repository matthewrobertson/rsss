class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :url
      t.text :title
      t.string :content_type
      t.string :host
      t.timestamps
    end
  end
end
