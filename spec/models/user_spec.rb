require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録に成功する場合' do
      it '必要な情報が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end

      it 'nicknameが6文字以下で登録できる' do
        @user.nickname = Faker::Internet.username(specifier: 1..6)
        @user.valid?
      end

      it 'emailに@が含まれいていれば登録できる' do
        @user.email = Faker::Internet.free_email
        @user.valid?
      end

      it 'passwordが小文字の英数字6文字以上で登録できる' do
        @user.password = Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1)
        @user.valid?
      end

      it 'password_confirmationがpasswordと一致していれば登録できる' do
        @user.password_confirmation = @user.password
        @user.valid?
      end

      it 'birth_dateが現在の90年前の1月1日から現在の5年前の12月31日まで登録できる' do
        @user.birth_date = Faker::Date.birthday(min_age: 5, max_age: 90)
        @user.valid?
      end
    end

    context 'ユーザー新規登録に失敗する場合' do
      it 'nicknameが空で登録に失敗する' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'nicknameが7文字以上で登録に失敗する' do
        @user.nickname = Faker::Internet.username(specifier: 7)
        @user.valid?
      end

      it 'emailが空で登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@がないと登録に失敗する' do
        @user.email = 'reginegmail.com'
        @user.valid?
      end

      it 'emailに既に存在している値があると登録に失敗する' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空で登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが英数字でないと登録に失敗する' do
        @user.password = 'あいうえおかき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが英数字でも全角で登録に失敗する' do
        @user.password = 'ｖv３１６ｑ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが英数字でも5文字以下で登録に失敗する' do
        @user.password = Faker::Alphanumeric.alphanumeric(number: 5, min_alpha: 1, min_numeric: 1)
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが英字のみで登録に失敗する' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが数字のみで登録に失敗する' do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが入力されていてもpassword_confirmationが空で登録に失敗する' do
        @user.password_confirmation = nil
        @user.valid?
      end

      it 'password_confirmationがpasswordと不一致で登録に失敗する' do
        @user.password = 'nk9p63'
        @user.password_confirmation = 'dddddd1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'birth_dateが空で登録に失敗する' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

      it 'birth_dateの年が現在から4年以内で登録に失敗する' do
        @user.birth_date = Faker::Date.birthday(max_age: 4)
        @user.valid?
      end

      it 'birth_dateの年が現在から90年以上前の値で登録に失敗する' do
        @user.birth_date = Faker::Date.birthday(min_age: 91)
        @user.valid?
      end

      it 'birth_dateの月日が選択できない値で登録に失敗する' do
        @user.birth_date = '1710-13-44'
        @user.valid?
      end
    end
  end
end
