require './test/test_helper'
require './lib/super_repository'
require './lib/invoice'

class SuperRepositoryTest < Minitest::Test

  def test_all_initializes_with_empty_array
    @sr = SuperRepository.new

    assert_equal [], @sr.all
  end

  def test_all_accepts_new_objects
    @sr = SuperRepository.new

    invoice_1 = Invoice.new({
      :id => 1,
      :customer_id => 1,
      :merchant_id => 12335938,
      :status => "pending",
      :created_at => "2009-02-07",
      :updated_at => "2014-03-15"
    })

    invoice_2 = Invoice.new({
      :id => 2,
      :customer_id => 1,
      :merchant_id => 12335938,
      :status => "pending",
      :created_at => "2009-02-07",
      :updated_at => "2014-03-15"
    })

    @sr.all << invoice_1
    @sr.all << invoice_2

    assert_equal [invoice_1, invoice_2], @sr.all
  end

  def test_find_by_id
    @sr = SuperRepository.new

    invoice_1 = Invoice.new({
      :id => 1,
      :customer_id => 1,
      :merchant_id => 12335938,
      :status => "pending",
      :created_at => "2009-02-07",
      :updated_at => "2014-03-15"
    })

    invoice_2 = Invoice.new({
      :id => 2,
      :customer_id => 1,
      :merchant_id => 12335938,
      :status => "pending",
      :created_at => "2009-02-07",
      :updated_at => "2014-03-15"
    })

    @sr.all << invoice_1
    @sr.all << invoice_2

    assert_equal invoice_1, @sr.find_by_id(1)
    assert_equal invoice_2, @sr.find_by_id(2)
  end

  def test_delete
    def test_find_by_id
      @sr = SuperRepository.new

      invoice_1 = Invoice.new({
        :id => 1,
        :customer_id => 1,
        :merchant_id => 12335938,
        :status => "pending",
        :created_at => "2009-02-07",
        :updated_at => "2014-03-15"
      })

      invoice_2 = Invoice.new({
        :id => 2,
        :customer_id => 1,
        :merchant_id => 12335938,
        :status => "pending",
        :created_at => "2009-02-07",
        :updated_at => "2014-03-15"
      })

      @sr.all << invoice_1
      @sr.all << invoice_2
      @sr.delete(2)
      assert_equal [invoice_1], @sr.all
    end
  end

end




