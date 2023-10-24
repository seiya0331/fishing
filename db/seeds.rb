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
  user.name = "魚"
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

Tweet.find_or_create_by! do |tweet|
  tweet.get_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  tweet.text = "大人気のカフェです。"
  tweet.user = 魚
end

Tweet.find_or_create_by! do |tweet|
  tweet.get_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  tweet.text = "日本料理は美しい！"
  tweet.user = マグロ
end

Tweet.find_or_create_by! do |tweet|
  tweet.get_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
  tweet.text = 'メキシコ料理好きな方にオススメ！'
  tweet.user = タイ
end