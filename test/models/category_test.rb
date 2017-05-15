require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "tree test if parent_id is added correctly" do
    root = Category.create(name: "sport")
    child1 = root.children.create(name: "rowery")
    child2 = child1.children.create(name: "części i akcesoria")
    assert_equal child1.id, child2.parent_id
  end

  test "name can't be blank" do
    root = FactoryGirl.create(:category)
    child1 = root.children.new
    child1.valid?
    assert_includes child1.errors[:name], "can't be blank"
  end
end
