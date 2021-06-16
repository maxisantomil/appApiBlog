class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :url_image
      t.date :date_creation

      t.timestamps
    end
  end
end
