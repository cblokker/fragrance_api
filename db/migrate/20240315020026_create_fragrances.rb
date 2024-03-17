class CreateFragrances < ActiveRecord::Migration[7.1]
  def change
    create_table :fragrances do |t|
      t.text :name, null: false
      t.string :description
      t.text :category, null: false
      t.string :image_url
      t.timestamps
    end
  end
end


