require 'test_helper'

class AdvertTest < ActiveSupport::TestCase
  test "title must be present" do
    ad = Advert.new
    ad.valid?
    assert_includes ad.errors[:title], "can't be blank"
  end

  test "title must be shorter than 80 chars" do
    long_string = "a" * 100
    ad = Advert.new(title: "#{long_string}")
    ad.valid?
    assert_includes ad.errors[:title], "is too long"  
  end
end
