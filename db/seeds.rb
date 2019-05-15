#カテゴリーのセット
categories = %w(勉強(Coding) 勉強(English) 運動 娯楽 映画・ドラマ)
categories.each do |category|
  Category.create(name: category)
end  

#管理者ユーザ追加
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

#サンプルタスク追加
 Task.crete!(
  title: "sample1",
  complete: true,
  user_id: 1,
  category_id: 1,
  minutes: 60
  )
  Task.crete!(
  title: "sample2",
  complete: true,
  user_id: 1,
  category_id: 1,
  minutes: 120
  )
  Task.crete!(
  title: "sample3",
  complete: false,
  user_id: 1,
  category_id: 2,
  minutes: 60
  )
  Task.crete!(
  title: "sample4",
  complete: false,
  user_id: 1,
  category_id: 3,
  minutes: 120
  )
  Task.crete!(
  title: "sample5",
  complete: true,
  user_id: 1,
  category_id: 4,
  minutes: 60
  )
  Task.crete!(
  title: "admin_sample",
  complete: true,
  user_id: 2,
  category_id: 1,
  minutes: 60
  )
  Task.crete!(
  title: "admin_sample2",
  complete: true,
  user_id: 2,
  category_id: 2,
  minutes: 120 )
  
 # updated_day: 20190515
 