class Category < ApplicationRecord
  include ActsAsTree
  extend ActsAsTree::TreeWalker
  extend ActsAsTree::TreeView

  has_many :advert_categories
  has_many :adverts, through: :advert_categories

  acts_as_tree :order => "name"

  validates :name, presence: true
end
