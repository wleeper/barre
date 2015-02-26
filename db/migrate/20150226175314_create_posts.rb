class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.String :title
      t.String :content
      t.User :author

      t.timestamps null: false
    end
  end
end
