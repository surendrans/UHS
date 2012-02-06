class Delivery < ActiveRecord::Base
  belongs_to :pickup
  has_many :delivery_units
end
