class AddChangeMonthSubmenu < ActiveRecord::Migration
  def self.up
    Submenu.create(:id => 14, :label => 'change_month', :menu_id => 1, :controller => 'montly_details', :action => 'change_month')
  end

  def self.down
    Submenu.find_by_id(14).destroy
  end
end
