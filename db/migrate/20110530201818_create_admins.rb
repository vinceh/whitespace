class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|

	  t.string		"username", 		:null => false
	  t.string		"hashed_password",	:null => false
	  
      t.timestamps
    end
  end

  def self.down
    drop_table :admins
  end
end
