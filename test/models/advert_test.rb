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
    assert_includes ad.errors[:title], "is too long (maximum is 80 characters)" 
  end

  test "description must be present" do
    ad = Advert.new
    ad.valid?
    assert_includes ad.errors[:description], "can't be blank"
  end

  test "price must be present" do
    ad = Advert.new
    ad.valid?
    assert_includes ad.errors[:price], "can't be blank"
  end

  test "price must not be lesser than 0" do
    ad = Advert.new(price: -1)
    ad.valid?
    assert_includes ad.errors[:price], "must be greater than or equal to 0"
  end

  test "price can be greater than or equal to 0" do
    ad = Advert.new(price: 23.89)
    ad.valid?
    assert_equal [], ad.errors[:price]
    ad1 = Advert.new(price: 0)
    ad1.valid?
    assert_equal [], ad.errors[:price]
  end

  test "scope active returns only active:true adverts" do
    FactoryGirl.create(:advert)
    FactoryGirl.create(:active_ad)
    expected = Advert.where(active: true).ids.sort
    assert_equal expected, Advert.active.ids.sort
  end

  test "scope inactive returns only active: false adverts" do
    FactoryGirl.create(:advert)
    FactoryGirl.create(:advert)
    expected = Advert.where(active: false).ids.sort
    assert_equal expected, Advert.inactive.ids.sort
  end
end
