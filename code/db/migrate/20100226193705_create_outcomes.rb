class CreateOutcomes < ActiveRecord::Migration
  def self.up
    create_table :outcomes do |t|
      t.integer :id
      t.date    :data_vencimento
      t.date    :data_pagamento
      t.string  :description
      t.float   :value
      
      t.integer :subcategory_id
      t.integer :company_id
      t.timestamps
    end
  end

  def self.down
    drop_table :outcomes
  end
end
