# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') 


FactoryBot.create(:post)
FactoryBot.create(:hunaki_labo2)
FactoryBot.create(:hunaki_labo3)
FactoryBot.create(:hunaki_labo4)

FactoryBot.create(:takai_labo)
FactoryBot.create(:takai_labo2)

Like.create(user_id: 1, post_id: 2)
Like.create(user_id: 1, post_id: 4)
Like.create(user_id: 3, post_id: 2)
Like.create(user_id: 4, post_id: 2)
Like.create(user_id: 2, post_id: 5)
Like.create(user_id: 3, post_id: 5)
Like.create(user_id: 6, post_id: 1)
Like.create(user_id: 5, post_id: 1)
