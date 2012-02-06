class WebModeSignOn < ActiveRecord::Base
  
  attr_accessible :name, :password
  before_save :generate_token
  validates :name, :presence => true, :uniqueness => true 
  validates_presence_of :password
  def self.authenticate(name, password)
    user = find_by_name(name)
    if user && user.password
      user
    else
      nil
    end
  end
  
  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)[8..16]
  end
end
