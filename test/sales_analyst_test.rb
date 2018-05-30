require './test/test_helper'
require './lib/sales_engine'
require './lib/sales_analyst'

class SalesAnalystTest < Minitest::Test
  def setup
    se = SalesEngine.from_csv({
      :items     => "./data/items.csv",
      :merchants => "./data/merchants.csv",
    })

    @sa = se.analyst
  end

  def test_it_exists
    assert_instance_of SalesAnalyst, @sa
  end

  def test_it_has_repos
    assert_instance_of ItemsRepository, @sa.items
    assert_instance_of MerchantRepo, @sa.merchants
  end

  def test_average_items_per_merchant
    assert_equal 2.88, @sa.average_items_per_merchant
  end

  def test_average_item_price_for_merchant
    merchant_id = 12334159
    avg_price = @sa.average_item_price_for_merchant(merchant_id)
    assert_instance_of BigDecimal, avg_price
  end

  def test_average_average_price_per_merchant
    avg_avg = @sa.average_average_price_per_merchant
    assert_instance_of BigDecimal, avg_avg
  end

  def test_average_items_per_merchant_standard_deviation
    assert_equal 3.26, @sa.average_items_per_merchant_standard_deviation
  end

  def test_merchants_with_high_item_count
    assert_equal 52, @sa.merchants_with_high_item_count.length
  end

  def test_golden_items
    assert_equal 5, @sa.golden_items.length
  end

end
