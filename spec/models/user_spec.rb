require 'rails_helper'

# RSpec.describe User, type: :model do
describe 'ユーザー新規登録' do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録が成功する時' do
      it '全ての項目が正しく入力できていれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordは英数字混合で6文字以上であれば登録できる' do
        @user.password = '123aaa'
        @user.password_confirmation = '123aaa'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録が失敗する時' do
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

      it '重複したemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに＠を含めること' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordは5文字以下では登録できない' do
        @user.password = '123aa'
        @user.password_confirmation = '123aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordは数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordは英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'last_nameは空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameは半角では登録できない' do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'last_nameに数字を含めて登録できない' do
        @user.last_name = '山田1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_namは空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameは半角では登録できない' do
        @user.last_name = 'ﾘｸﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_nameに数字を含めて登録できない' do
        @user.first_name = '陸太郎1'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_name_kanaは空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'last_name_kanaは半角では登録できない' do
        @user.last_name_kana = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'last_name_kanaに漢字を含めて登録できない' do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'last_name_kanaにひらがなを含めて登録できない' do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'last_name_kanaにアルファベットを含めて登録できない' do
        @user.last_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'last_name_kanaに数字を含めて登録できない' do
        @user.last_name_kana = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'first_nam_kanaは空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaは半角では登録できない' do
        @user.first_name_kana = 'ﾘｸﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'first_name_kanaに漢字を含めて登録できない' do
        @user.first_name_kana = '陸太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'first_name_kanaにひらがなを含めて登録できない' do
        @user.first_name_kana = 'りくたろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'first_name_kanaにアルファベットを含めて登録できない' do
        @user.first_name_kana = 'rikutaro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'first_name_kanaに数字を含めて登録できない' do
        @user.first_name_kana = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'birthdayは空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

# RSpec.describe '新規登録〜ログアウト', type: :system do
# before do
# @user = FactoryBot.build(:user)
# end
# context 'ユーザー新規登録からログアウトまで' do
# it 'ユーザーの新規登録が成功し、ログアウトできる' do
# トップページへ移動する
# visit root_path

# トップページにサインアップページへ遷移するボタンがあることを確認する
# expect(page).to have_content('新規登録')

# 新規登録ページに移動する
# visit new_user_registration_path

# ユーザー情報を入力する
# fill_in 'nickname', with: @user.nickname
# fill_in 'email', with: @user.email
# fill_in 'password', with: @user.password
# fill_in 'password-confirmation', with: @user.password_confirmation
# fill_in 'last-name', with: @user.last_name
# fill_in 'first-name', with: @user.first_name
# fill_in 'last-name-kana', with: @user.last_name_kana
# fill_in 'first-name-kana', with: @user.first_name_kana
# select '1993', from: 'user_birthday_1i'
# select '11', from: 'user_birthday_2i'
# select '16', from: 'user_birthday_3i'

# 会員登録ボタンを押すとユーザーモデルのカウントが1上がることを確認する
# expect{
# find('input[name="commit"]').click
# }.to change { User.count }.by(1)

# トップページへ遷移することを確認する
# expect(current_path).to eq root_path

# サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
# expect(page).to have_no_content('新規登録')
# expect(page).to have_no_content('ログイン')

# ログアウトボタンをクリックするとログアウトできる
# find(".lists-right").find("li").find(".logout").click
# expect(page).to have_no_content('ログアウト')
# end
# end

# context 'ユーザー新規登録ができない' do
# it '誤った情報でユーザ新規登録ができず、新規登録ページに戻ってくる'
# トップページへ移動する
# visit root_path

# トップページにサインアップページへ遷移するボタンがあることを確認する
# expect(page).to have_content('新規登録')

# 新規登録ページへ移動する
# visit new_user_registration_path

# ユーザー情報を入力する
# fill_in 'ニックネーム', with: ""
# fill_in 'メールアドレス', with: ""
# fill_in 'パスワード', with: ""
# fill_in 'パスワード(確認)', with: ""
# fill_in 'last-name', with: ""
# fill_in 'first-name', with: ""
# fill_in 'last-name-kana', with: ""
# fill_in 'last-name-kana', with:  ""

# 会員登録ボタンを押しても、ユーザーモデルのカウントが上がらないことを確認
# expect{
# find('input[name="commit"]').click
# }.to change { User.count }.by(0)

# ️新規登録ページにへ戻されることを確認する
# expect(current_path).to eq "/users"
# end
# end
# end
