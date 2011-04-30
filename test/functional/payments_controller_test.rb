require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Payment.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Payment.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Payment.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to payment_url(assigns(:payment))
  end

  def test_edit
    get :edit, :id => Payment.first
    assert_template 'edit'
  end

  def test_update_invalid
    Payment.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Payment.first
    assert_template 'edit'
  end

  def test_update_valid
    Payment.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Payment.first
    assert_redirected_to payment_url(assigns(:payment))
  end

  def test_destroy
    payment = Payment.first
    delete :destroy, :id => payment
    assert_redirected_to payments_url
    assert !Payment.exists?(payment.id)
  end
end
