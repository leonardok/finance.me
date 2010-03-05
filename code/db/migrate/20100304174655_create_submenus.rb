class CreateSubmenus < ActiveRecord::Migration
  def self.up
    create_table :submenus do |t|
      t.string  :label
      t.integer :menu_id
      t.string  :controller
      t.string  :action
    end

    add_index :submenus, :controller
    add_index :submenus, :action
  end

  def self.down
    drop_table :submenus
  end
end
