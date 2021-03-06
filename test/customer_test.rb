require './test/test_helper'
require './lib/customer'

class CustomerTest < Minitest::Test
  def setup
    attributes = {
      id: 6,
      first_name: 'Joan',
      last_name: 'Clarke',
      created_at: Time.now,
      updated_at: Time.now
    }
    @customer = Customer.new(attributes)
  end

  def test_has_attributes
    assert_equal 6, @customer.id
    assert_equal 'Joan', @customer.first_name
    assert_equal 'Clarke', @customer.last_name
    assert_instance_of Time, @customer.created_at
    assert_instance_of Time, @customer.updated_at
  end
end
