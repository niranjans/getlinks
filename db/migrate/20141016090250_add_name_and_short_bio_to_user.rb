class AddNameAndShortBioToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :short_bio, :string
  end
end
