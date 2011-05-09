class PaymentObserver < ActiveRecord::Observer
  def after_create(payment)
    UserMailer.new_payment_made(payment).deliver
  end
end
