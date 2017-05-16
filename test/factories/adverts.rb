FactoryGirl.define do
  factory :advert do
    title 'Schwalbe Lugano'
    description 'Schwalbe Lugano 700x28c'
    price 49.99
    user_id 1

    factory :active_ad do
      title 'Schwalbe Durano'
      active true
    end 
  end
end