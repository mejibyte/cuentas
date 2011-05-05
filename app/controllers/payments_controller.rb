# encoding: utf-8
class PaymentsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @payments = Payment.all
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(params[:payment])
    if @payment.save
      flash[:notice] = "Se agregó el pago."
      redirect_to @payment
    else
      render :action => 'new'
    end
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])
    if @payment.update_attributes(params[:payment])
      flash[:notice] = "Se actualizó el pago."
      redirect_to payment_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    flash[:notice] = "Se borró el pago."
    redirect_to payments_url
  end
end
