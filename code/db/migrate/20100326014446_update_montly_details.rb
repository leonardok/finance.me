class UpdateMontlyDetails < ActiveRecord::Migration
  def self.up
    Submenu.find_by_id(1).destroy
    Submenu.find_by_id(14).destroy    
    Submenu.create(:id => 1, :label => 'show_month', :menu_id => 1, :controller => 'montly_details', :action => 'show')
    Submenu.create(:id => 14, :label => 'change_month', :menu_id => 1, :controller => 'montly_details', :action => 'index')
  end

  def self.down
    Submenu.find_by_id(1).destroy
    Submenu.find_by_id(14).destroy    
    Submenu.create(:id => 1, :label => 'another_month', :menu_id => 1, :controller => 'montly_details', :action => 'index')
    Submenu.create(:id => 14, :label => 'change_month', :menu_id => 1, :controller => 'montly_details', :action => 'change_month')
  end
end
