class User < ActiveRecord::Base
  has_many :payments
  
  def to_s
    name
  end
  
  def balance
    payments.sum(:price) - Payment.expected_average_for_users
  end
end
