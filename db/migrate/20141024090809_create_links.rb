class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.text :url
      t.string :link_type
      t.integer :position
      t.references :user, index: true

      t.timestamps
    end
  end
end
