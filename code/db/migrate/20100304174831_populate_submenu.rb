class PopulateSubmenu < ActiveRecord::Migration
  def self.up
    Submenu.create(:id => 1, :label => 'another_month', :menu_id => 1, :controller => 'montly_details', :action => 'index')
  	Submenu.create(:id => 2, :label => 'list_incomes', :menu_id => 2, :controller => 'incomes', :action => 'index')
  	Submenu.create(:id => 3, :label => 'add_incomes', :menu_id => 2, :controller => 'incomes', :action => 'new')
  	Submenu.create(:id => 4, :label => 'list_outcomes', :menu_id => 3, :controller => 'outcomes', :action => 'index')
  	Submenu.create(:id => 5, :label => 'add_outcomes', :menu_id => 3, :controller => 'outcomes', :action => 'new')
  	Submenu.create(:id => 6, :label => 'list_planned_outcomes', :menu_id => 3, :controller => 'outcome_plannings', :action => 'index')
  	Submenu.create(:id => 7, :label => 'add_planned_outcomes', :menu_id => 3, :controller => 'outcome_plannings', :action => 'new')
  	Submenu.create(:id => 8, :label => 'list_categories', :menu_id => 4, :controller => 'categories', :action => 'index')
  	Submenu.create(:id => 9, :label => 'add_categories', :menu_id => 4, :controller => 'categories', :action => 'new')
  	Submenu.create(:id => 10, :label => 'list_companies', :menu_id => 5, :controller => 'companies', :action => 'index')
  	Submenu.create(:id => 11, :label => 'add_companies', :menu_id => 5, :controller => 'companies', :action => 'new')
  	Submenu.create(:id => 12, :label => 'list_subcategories', :menu_id => 4, :controller => 'subcategories', :action => 'index')
  	Submenu.create(:id => 13, :label => 'add_subcategories', :menu_id => 4, :controller => 'subcategories', :action => 'new')
  end

  def self.down
    Submenu.find_by_id(1).destroy
  	Submenu.find_by_id(2).destroy
  	Submenu.find_by_id(3).destroy
  	Submenu.find_by_id(4).destroy
  	Submenu.find_by_id(5).destroy
  	Submenu.find_by_id(6).destroy
  	Submenu.find_by_id(7).destroy
  	Submenu.find_by_id(8).destroy
  	Submenu.find_by_id(9).destroy
  	Submenu.find_by_id(10).destroy
  	Submenu.find_by_id(11).destroy
  	Submenu.find_by_id(12).destroy
  	Submenu.find_by_id(13).destroy
  end
end
