class Category < ApplicationRecord
  include ActsAsTree
  extend ActsAsTree::TreeWalker

  has_many :advert_categories
  has_many :adverts, through: :advert_categories

  acts_as_tree :order => "name"
end
