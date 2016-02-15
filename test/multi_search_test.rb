require_relative "test_helper"

class MultiSearchTest < Minitest::Test
  def test_basic
    store_names ["Product A"]
    store_names ["Store A"], Store
    products = Product.search("*", execute: false)
    stores = Store.search("*", execute: false)
    Searchkick.multi_search([products, stores])
    assert_equal ["Product A"], products.map(&:name)
    assert_equal ["Store A"], stores.map(&:name)
  end
end
