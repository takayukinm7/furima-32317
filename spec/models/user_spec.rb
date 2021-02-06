require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '各項目を適切に入力していれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailがuniqueでないと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailには＠が含まれている' do
      @user.email = 'a@a'
      expect(@user).to be_valid
    end
    it 'emailに＠が存在しないと登録できない' do
      @user.email = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが６文字以上であれば登録できること' do
      @user.password = '111aaa'
      @user.password_confirmation = '111aaa'
      expect(@user).to be_valid
    end
    it 'passwordが５文字以下であれば登録できない' do
      @user.password = '111aa'
      @user.password_confirmation = '111aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordには半角英数が共に含まれる' do
      @user.password = '111aaa'
      @user.password_confirmation = '111aaa'
      expect(@user).to be_valid
    end
    it 'passwordが半角英しか存在しないと登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが半角数字しか存在しないと登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordは２回入力が必要' do
      @user.password = '111aaa'
      @user.password_confirmation = '111aaa'
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '111aaa'
      @user.password_confirmation = '111qqq'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'familynameが空では登録できない' do
      @user.familyname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Familyname can't be blank")
    end
    it 'firstnameが空では登録できない' do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end
    it 'famirlynameは全角入力する' do
      @user.familyname = '山田'
      expect(@user).to be_valid
    end
    it 'famirlnameは全角でないと存在できない' do
      @user.familyname = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Familyname is invalid')
    end
    it 'firstnameは全角入力する' do
      @user.firstname = '太郎'
      expect(@user).to be_valid
    end
    it 'firstnameは全角でないと存在できない' do
      @user.firstname = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('Firstname is invalid')
    end
    it 'familynamekanaが空では登録できない' do
      @user.familynamekana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Familynamekana can't be blank")
    end
    it 'firstnamekanaが空では登録できない' do
      @user.firstnamekana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstnamekana can't be blank")
    end
    it 'familynamekanaはカタカナで入力する' do
      @user.familynamekana = 'ヤマダ'
      expect(@user).to be_valid
    end
    it 'familynamekanaはカタカナでないと登録できない' do
      @user.familynamekana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include('Familynamekana is invalid')
    end
    it 'firstnamekanaはカタカナで入力する' do
      @user.firstnamekana = 'タロウ'
      expect(@user).to be_valid
    end
    it 'firstnamekanaはカタカナでないと登録できない' do
      @user.firstnamekana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('Firstnamekana is invalid')
    end
    it '生年月日が空では登録できない' do
      @user.date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date can't be blank")
    end
  end
end
