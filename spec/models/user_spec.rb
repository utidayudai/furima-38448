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
        expect(@user.errors.full_messages).to include
      end
      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = '/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i'
        @user.valid?
        expect(@user.errors.full_messages).to include
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
        expect(@user.errors.full_messages).to include
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = '/\A[ぁ-んァ-ヶ一-龥々ー]+\z/'
        @user.first_name = '/\A[ぁ-んァ-ヶ一-龥々ー]+\z/'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
        @user.kana_last_name = ''
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.kana_last_name = '/\A[ァ-ヶ]+\z/'
        @user.kana_first_name = '/\A[ァ-ヶ]+\z/'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end
      it ' 生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end