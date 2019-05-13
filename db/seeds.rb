# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') 

=begin
FactoryBot.create(:post)
FactoryBot.create(:hunaki_labo2)
FactoryBot.create(:hunaki_labo3)
FactoryBot.create(:hunaki_labo4)

FactoryBot.create(:tatibana_labo)
FactoryBot.create(:tatibana_labo2)
=end

User.create!(
  [
   {
    username: "abc1",
    email: "test1@example.com",
    password: "foobar",
    confirmed_at: Time.now
   },
   {
    username: "abc2",
    email: "test2@example.com",
    password: "foobar",
    confirmed_at: Time.now
   },
   {
    username: "abc3",
    email: "test3@example.com",
    password: "foobar",
    confirmed_at: Time.now
   },
   {
    username: "abc4",
    email: "test4@example.com",
    password: "foobar",
    confirmed_at: Time.now
   },
   {
    username: "abc5",
    email: "test5@example.com",
    password: "foobar",
    confirmed_at: Time.now
   },
   {
    username: "abc6",
    email: "test6@example.com",
    password: "foobar",
    confirmed_at: Time.now
   }
)

User.find(1).posts.create!(university: "大阪大学", department: "工学部", major: "電子情報工学科", professor: "舟木剛", detail: "教授はひねくれてます")
User.find(2).posts.create!(university: "大阪大学", department: "工学部", major: "電子情報工学科", professor: "舟木剛", detail: "朝から晩まで研究しないと卒業させてもらえません。")
User.find(3).posts.create!(university: "大阪大学", department: "工学部", major: "電子情報工学科", professor: "舟木剛", detail: "教授が他の研究室の教授よりとにかく厳しいです")
User.find(4).posts.create!(university: "大阪大学", department: "工学部", major: "電子情報工学科", professor: "舟木剛", detail: "隔週土曜日に研究会という名の進捗発表会があります。")
User.find(5).posts.create!(university: "早稲田大学", department: "理工学部", major: "機械工学科", professor: "橘", detail: "教授がとても優しくホワイト研究室です")
User.find(6).posts.create!(university: "早稲田大学", department: "理工学部", major: "機械工学科", professor: "橘", detail: "教授が結構放置気味なので、そんなに研究しなくても卒業できます")

Like.create(user_id: 1, post_id: 2)
Like.create(user_id: 1, post_id: 4)
Like.create(user_id: 3, post_id: 2)
Like.create(user_id: 4, post_id: 2)
Like.create(user_id: 2, post_id: 5)
Like.create(user_id: 3, post_id: 5)
Like.create(user_id: 6, post_id: 1)
Like.create(user_id: 5, post_id: 1)
