class CreateSeeds < ActiveRecord::Migration
  def self.up
    create_table :seeds do |t|
	  
	  t.string		"title",		:default => ""
	  t.string		"description",	:default => ""
	  t.string		"content",						:null => false
	  t.string		"mediatype",							:null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :seeds
  end
end
