class SinglePostSerializer < ActiveModel::Serializer
  attributes :id,:title,:url_image,:content,:date_creation,:user_id
  has_many:categories
end
