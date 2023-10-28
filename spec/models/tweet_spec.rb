require 'rails_helper'

RSpec.describe 'Tweetモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { tweet.valid? }

    let(:user) { create(:user) }
    let!(:tweet) { build(:tweet, user_id: user.id) }

    context 'tweetカラム' do
      it '空欄でないこと' do
        tweet.text = ''
        is_expected.to eq false
      end
      it '200文字以下であること: 200文字は〇' do
        tweet.text = Faker::Lorem.characters(number: 200)
        is_expected.to eq true
      end
      it '200文字以下であること: 201文字は×' do
        tweet.text = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Tweet.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end