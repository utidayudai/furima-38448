require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録できないとき' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end
      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '11111'
        @user.password_confirmation ='11111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、半角英字だけでは登録できない' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードは、半角数字だけでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードは、全角文字を含むと登録できない' do
        @user.password = '１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
        @user.last_name = ''
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください','First name 全角文字を使用してください')
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'test'
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください','First name 全角文字を使用してください')
      end
      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
        @user.kana_last_name = ''
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name にはカタカナを設定してください','Kana first name にはカタカナを設定してください')
      end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.kana_last_name = 'てすと'
        @user.kana_first_name = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name にはカタカナを設定してください','Kana first name にはカタカナを設定してください')
      end
      it ' 生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end