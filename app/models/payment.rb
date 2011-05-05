class Payment < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :price, :paid_on, :user_id
    validates_numericality_of :price, :only_integer => true
    
    default_scope order("paid_on DESC")
    
    def self.expected_average_for_users
      1.0 * Payment.sum(:price) / User.count
    end
end
