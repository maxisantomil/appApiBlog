class PostSerializer < ActiveModel::Serializer
  attributes :id,:title,:url_image,:date_creation,:user_id
  has_many:categories
end
