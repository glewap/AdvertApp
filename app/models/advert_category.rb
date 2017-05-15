class AdvertCategory < ApplicationRecord
  belongs_to :categories
  belongs_to :adverts
end
