# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

sample_fragrances = [
  {
    id: 1,
    name: "Herb Garden",
    description: "A refreshing fragrance that captures the essence of an aromatic herb",
    category: "Herbacios",
    image_url: "https://i1.wp.com/www.mercurynews.com/wp-content/uploads/2020/11/SJM-L-HERBS-1129-03.jpg?fit=1280%2C9999px&ssl=1"
  },
  {
    id: 2,
    name: "Campfire at Dusk",
    description: "test string",
    category: "Smokey",
    image_url: ""
  },
  {
    id: 3,
    name: "Burnt Umber",
    description: "test string",
    category: "Smokey",
    image_url: ""
  },
  {
    id: 4,
    name: "Fruity smell",
    description: "test string",
    category: "Fruity",
    image_url: ''
  },
  {
    id: 5,
    name: "Laundry Detergent",
    description: "test string",
    category: "Fresh",
    image_url: ""
  },
  {
    id: 6,
    name: "Rose Garden",
    description: "test string",
    category: "Floral",
    image_url: ""
  }
]

Fragrance.upsert_all(sample_fragrances, unique_by: :id)
