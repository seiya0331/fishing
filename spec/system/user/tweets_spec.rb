require 'rails_helper'

  describe '投稿のテスト' do
    let(:user) { create(:user) }
    let!(:other_user) { create(:user) }
    let!(:tweet) { create(:tweet, user: user) }
    let!(:other_tweet) { create(:tweet, user: other_user) }
    let!(:tweet) { create(:tweet, text:'hoge') }
    describe 'トップ画面(root_path)のテスト' do
      before do
        visit root_path
       end
       context '表示の確認' do
         it 'root_pathが"/"であるか' do
           expect(current_path).to eq('/')
         end
       end
     end

     describe "一覧画面のテスト" do
       before do
         sign_in user
         visit new_tweet_path
       end

       context '投稿処理に関するテスト' do
          it '投稿に成功しサクセスメッセージが表示されるか' do
            fill_in 'tweet[text]', with: Faker::Lorem.characters(number:20)
            click_button '投稿'
            expect(page).to have_content '投稿に成功しました。'
          end
          it '投稿に失敗する' do
            click_button '投稿'
            expect(page).to have_content '投稿に失敗しました。'
          end
          it '投稿後のリダイレクト先は正しいか' do
            fill_in 'tweet[text]', with: Faker::Lorem.characters(number:20)
            click_button '投稿'
            expect(page).to have_current_path tweet_path(Tweet.last)
          end
          context 'tweet削除のテスト' do
            it 'tweetの削除' do
               expect{ tweet.destroy }.to change{ Tweet.count }.by(-1)
               # ※本来はダイアログのテストまで行うがココではデータが削除されることだけをテスト
             end
          end
       end
     end
     describe '投稿を編集する' do
       before do
         sign_in user
         visit edit_tweet_path(tweet)
       end
       context '表示の確認' do
         it '編集前のテキストが表示されている' do
           fill_in 'tweet[text]', with: Faker::Lorem.characters(number:20)
       end
         it '保存ボタンが表示される' do
           expect(page).to have_button '保存'
         end
       end
       context '投稿の更新処理に関するテスト' do
         it '更新に成功しサクセスメッセージが表示されるか' do
           fill_in 'tweet[text]', with: Faker::Lorem.characters(number:20)
           click_button '保存'
           expect(page).to have_content '更新しました。'
         end
         it '更新に失敗しエラーメッセージが表示されるか' do
           fill_in 'tweet[text]', with: ""
           click_button '保存'
           expect(page).to have_content '更新できませんでした。'
         end
         it '更新後のリダイレクト先は正しいか' do
           fill_in 'tweet[text]', with: Faker::Lorem.characters(number:20)
           click_button '保存'
           expect(page).to have_current_path tweet_path(tweet)
         end
       end
     end
  end
