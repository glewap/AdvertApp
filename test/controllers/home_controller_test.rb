require 'test_helper'
# include Devise::Test::ControllerHelpers

class HomeControllerTest < ActionDispatch::IntegrationTest
  def sign_in(new_user)
    post user_session_path(params: {'user[email]' => new_user.email, 'user[password]' => new_user.password})
  end


  test "#index should return 200" do
    get home_index_path
    assert_response :success
  end

  test "#index display only active adverts" do
    user = FactoryGirl.create(:user)
    ad = FactoryGirl.create(:advert)
    ad2 = FactoryGirl.create(:active_ad)
    expected = ad2.title
    counter = Advert.active.count

    get home_index_path
    assert_select 'div.advert', {count: counter} do
      assert_select 'h3', text: "#{expected}"
    end
  end

  test "#show sholud return 200" do
    user = FactoryGirl.create(:user)
    ad_id = FactoryGirl.create(:active_ad).id
    get home_path(id: ad_id)
    assert_response :success
  end

  test "#show display advert content" do
    user = FactoryGirl.create(:user)
    ad = FactoryGirl.create(:active_ad)
    ad2 = FactoryGirl.create(:advert)
    counter = Advert.active.count

    get home_path(id: ad.id)
    assert_select 'div.advert', {count: counter} do
      assert_select 'h1.title', text: "#{ad.title}"
      assert_select 'h3.price', text: "#{ad.price}"
      assert_select 'div.description', text: "#{ad.description}"
    end
  end

  # test "#new should return 200" do
  #   user = FactoryGirl.create(:user)
  #   sign_in(user)
  #   get new_home_path
  # end

end