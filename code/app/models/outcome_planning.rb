class OutcomePlanning < ActiveRecord::Base
  belongs_to :subcategory
  
  validates_presence_of :description, :value, :subcategory_id
end
