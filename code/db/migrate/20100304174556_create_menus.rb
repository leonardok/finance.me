class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.string :label	
    end
  end

  def self.down
    drop_table :menus
  end
end
