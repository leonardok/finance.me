class PopulateMenu < ActiveRecord::Migration
  def self.up
    Menu.create(:id => 1, :label => "montly_details")
    Menu.create(:id => 2, :label => "incomes")
    Menu.create(:id => 3, :label => 'outcomes')
    Menu.create(:id => 4, :label => 'categories')
    Menu.create(:id => 5, :label => 'companies')
  end

  def self.down
	Menu.find_by_id(1).destroy
	Menu.find_by_id(2).destroy
	Menu.find_by_id(3).destroy
	Menu.find_by_id(4).destroy
	Menu.find_by_id(5).destroy
  end
end
