class Payment < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :price, :paid_on, :user_id
    validates_numericality_of :price, :only_integer => true
    
    default_scope order("paid_on DESC")
end
