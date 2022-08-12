# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admins = [
  {email: 'docchi@hoge.com', password: '111111'},
]

admins.each do |admin|
  # 一度ユーザーをメールアドレスで検索
  admin_data = Admin.find_by(email: admin[:email])
  # 該当ユーザーがいなければ、createする
  if admin_data.nil?
    Admin.create(
      email: admin[:email],
      password: admin[:password]
    )
  end
end

genres = [
   "音楽", "お金" "環境問題・エコロジー",
   "経済・金融", "ゲーム", "子育て", "仕事", "文学・本",
   "ペット・動物", "レジャー・旅行", "恋愛", "お笑い", "その他"]
genres.each do |genre|
  Genre.find_or_create_by(name: genre)
end