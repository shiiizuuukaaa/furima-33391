require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 
    it 'ニックネームが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'メールアドレスが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'メールアドレスが既に登録されているメールアドレスだと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'パスワードが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードが６文字未満だと登録できない' do
      @user.password = 'aaa11'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'パスワードが半角英数字混合でないと登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
    end
    it 'パスワードとパスワード(確認用)が一致しないと登録できない' do
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'ユーザー苗字が空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'ユーザー苗字が全角でないと登録できない' do
      @user.first_name = 'myouji'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name Full-width characters"
    end
    it 'ユーザー名前が空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'ユーザー名前が全角でないと登録できない' do
      @user.last_name = 'manae'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name Full-width characters"
    end
    it 'ユーザー苗字カナが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'ユーザー苗字カナが全角カナでないと登録できない' do
      @user.first_name_kana = 'ﾐｮｳｼﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana Full-width katakana characters"
    end
    it 'ユーザー名前カナが空だと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it 'ユーザー名前カナが全角カナでないと登録できない' do
      @user.last_name_kana = 'ﾅﾏｴ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana Full-width katakana characters"
    end
    it '生年月日が空だと登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end
  end
end
