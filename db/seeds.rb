# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#カテゴリーのセット
categories = %w(勉強(Coding) 勉強(English) 運動 娯楽 映画・ドラマ)
categories.each do |category|
  Category.create(name: category)
end  

#管理者追加
 User.create!(
     email: "admin@example.com",
     password: "000000",
     nick_name: "Administrator",
     admin: true
     )
     
#テストユーザ追加
 User.create!(
     email: "test@example.com",
     password: "000000",
     nick_name: "test_user",
     admin: false
     )
