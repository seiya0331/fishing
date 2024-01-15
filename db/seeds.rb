#管理者ログイン
Admin.create!(
   email: 'admin@admin',
   password: '123456'
)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
魚 = User.find_or_create_by!(email: "sakana@sample.com") do |user|
  user.name = "サカナ"
  user.password = "123456"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

マグロ = User.find_or_create_by!(email: "maguro@sample.com") do |user|
  user.name = "マグロ"
  user.password = "123456"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

タイ = User.find_or_create_by!(email: "tai@sample.com") do |user|
  user.name = "タイ"
  user.password = "123456"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

イカ = User.find_or_create_by!(email: "ika@sample.com") do |user|
  user.name = "イカ"
  user.password = "123456"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")
end

ブリ = User.find_or_create_by!(email: "buri@sample.com") do |user|
  user.name = "ブリ"
  user.password = "123456"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")
end

バス = User.find_or_create_by!(email: "basu@sample.com") do |user|
  user.name = "バス"
  user.password = "123456"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")
end

タコ = User.find_or_create_by!(email: "tako@sample.com") do |user|
  user.name = "タコ"
  user.password = "123456"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")
end



Tweet.find_or_create_by!(text: "新しいリールを書いました。") do |tweet|
  tweet.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  tweet.user = 魚
end

Tweet.find_or_create_by!(text: "大きいマグロを釣るぞ！！") do |tweet|
  tweet.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  tweet.user = マグロ
end

Tweet.find_or_create_by!(text: "タイを釣りました。刺身にして食べます。") do |tweet|
  tweet.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
  tweet.user = タイ
end

Tweet.find_or_create_by!(text: "イカを釣りに来ました。") do |tweet|
  tweet.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg")
  tweet.user = イカ
end

Tweet.find_or_create_by!(text: "でかいブリが釣りました。") do |tweet|
  tweet.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg")
  tweet.user = ブリ
end

Tweet.find_or_create_by!(text: "40センチ以上が釣れました。") do |tweet|
  tweet.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post6.jpg"), filename:"sample-post6.jpg")
  tweet.user = バス
end

Tweet.find_or_create_by!(text: "フィッシュキャッチャーがあると便利です。") do |tweet|
  tweet.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post7.jpg"), filename:"sample-post7.jpg")
  tweet.user = タコ
end