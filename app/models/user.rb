class User < ActiveRecord::Base
  has_many :payments
  
  def to_s
    name
  end
end
