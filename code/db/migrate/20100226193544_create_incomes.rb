class CreateIncomes < ActiveRecord::Migration
  def self.up
    create_table :incomes do |t|
      t.string  :description
      t.date    :date
      t.float   :value

      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :incomes
  end
end
