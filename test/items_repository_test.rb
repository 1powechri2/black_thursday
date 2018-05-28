require_relative 'test_helper'
require './lib/items_repository'
require 'csv'

class ItemsRepositoryTest < Minitest::Test
  def setup
    items = CSV.open './data/test_items.csv',
                      headers: true,
                      header_converters: :symbol
    @ir = ItemsRepository.new(items)
  end

  def test_items_repo_exists
    assert_instance_of ItemsRepository, @ir
  end

  def test_it_initializes_empty
    assert_equal [], @ir.all
  end

  def test_it_can_load_items
    csv = @ir.items_csv
    @ir.load_items(csv)

    assert_equal 5, @ir.all.length
  end

  def test_find_by_id
    csv = @ir.items_csv
    @ir.load_items(csv)

    nil_id = 1984
    assert_nil @ir.find_by_id(nil_id)

    real_id = 263395237
    assert_instance_of Item, @ir.find_by_id(real_id)
  end
end
