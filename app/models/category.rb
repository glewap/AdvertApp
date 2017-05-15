class Category < ApplicationRecord
  include ActsAsTree

  acts_as_tree :order => "name"
end
