class PostSerializer < ActiveModel::Serializer
  attributes :id,:title,:url_image,:date_creation
  has_many:categories
end
