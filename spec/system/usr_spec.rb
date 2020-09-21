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
