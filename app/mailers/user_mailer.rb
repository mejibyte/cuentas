# encoding: utf-8
class UserMailer < ActionMailer::Base
  default :from => "Nuestro Apartamento <andmej@gmail.com>"
    
  def new_payment_made(payment)
    @payment = payment
    @user = @payment.user
    mail(:to => User.all.collect(&:email), :subject => "#{@user.name} agregó un nuevo pago")
  end
end
