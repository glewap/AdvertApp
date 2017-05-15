class Advert < ApplicationRecord
  has_many :advert_categories
  has_many :categories, through: :advert_categories

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  validates :title, presence: true
  validates :title, length: { maximum: 80 }
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
