class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :bio, :text
  end
end
