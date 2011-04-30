require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Payment.new.valid?
  end
end
