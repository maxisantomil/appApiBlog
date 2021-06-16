class CategoriesController < ApplicationController
    has_many :post_categories
    has_many :posts, through: :post_categories
end
