require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "tree test if parent_id is added correctly" do
    root = Category.create(name: "sport")
    child1 = root.children.create(name: "rowery")
    child2 = child1.children.create(name: "części i akcesoria")
    assert_equal child1.id, child2.parent_id
  end
end
