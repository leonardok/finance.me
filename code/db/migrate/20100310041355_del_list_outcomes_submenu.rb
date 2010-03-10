class DelListOutcomesSubmenu < ActiveRecord::Migration
  def self.up
  	Submenu.find_by_id(4).destroy
  end

  def self.down
    Submenu.create(:id => 4, :label => 'list_outcomes', :menu_id => 3, :controller => 'outcomes', :action => 'index')
  end
end
