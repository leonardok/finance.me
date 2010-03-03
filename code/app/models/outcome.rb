class Outcome < ActiveRecord::Base
  belongs_to :subcategory
  belongs_to :company
  
  validates_presence_of :description, :value, :subcategory_id, :company_id
end
