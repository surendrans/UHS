class AdminsProduct < ActiveRecord::Base
  belongs_to :admin
  belongs_to :product
end
