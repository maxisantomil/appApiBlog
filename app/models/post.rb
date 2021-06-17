class Post < ApplicationRecord
    has_many :post_categories, dependent: :destroy
    has_many :categories, through: :post_categories 
    belongs_to :user # campo adicional user_id
    validates :title, presence: true,uniqueness: true, length: {minimum: 5}
end
