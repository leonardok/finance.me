class CreateOutcomePlannings < ActiveRecord::Migration
  def self.up
    create_table :outcome_plannings do |t|
      t.float    :value
      t.string   :description
      t.integer  :subcategory_id
      t.date     :plan_for_date

      t.timestamps
    end
  end

  def self.down
    drop_table :outcome_plannings
  end
end
