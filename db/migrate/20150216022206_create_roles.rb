class CreateRoles < ActiveRecord::Migration
	class Role < ActiveRecord::Base
	end

  
  def up
    create_table :roles do |t|
      t.string :name

      t.timestamps null: false
    end

    Role.create name: 'Administrator'
    Role.create name: 'Teacher'
    Role.create name: 'Student'
  end

  def down
  	drop_table :roles
  end

end
