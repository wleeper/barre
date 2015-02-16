class RemoveUnusedColumnsFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :type
  	remove_column :users, :username
  end
end
