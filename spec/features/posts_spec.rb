require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  
  scenario "simulations of all functions", js: true do

    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)

    visit root_path
    fill_in "q[university_cont]", with: "大阪"
    click_button "検索する"
    expect(page).to have_content "大阪"
    click_link "詳しく見る"
    expect(page).to have_current_path "/posts/#{post.id}"

    visit root_path
    fill_in "q[university_cont]", with: "大阪"
    fill_in "q[department_cont]", with: "工"
    fill_in "q[major_cont]", with: "電子情報"
    fill_in "q[professor_cont]", with: "舟木"
    click_button "検索する"
    expect(page).to have_content "大阪"
    expect(page).to have_content "工"
    expect(page).to have_content "電子情報"
    expect(page).to have_content "舟木"
    click_link "詳しく見る"
    expect(page).to have_current_path "/posts/#{post.id}"

    visit root_path
    fill_in "q[university_cont]", with: "東北"
    click_button "検索する"
    expect(page).to have_content "該当する口コミは見つかりませんでした"
    expect(page).not_to have_content "検索結果"

    visit root_path
    click_button "検索する"
    expect(page).to have_content "検索項目を入力してください"
    expect(page).not_to have_content "検索結果"

    visit root_path
    click_link "口コミ投稿"
    expect(page).to have_content "アカウント登録もしくはログインしてください"
    expect(page).to have_content "ログイン画面"
    click_link "ゼミラボナビ"
    expect(page).to have_current_path root_path
    click_link "ログイン"
    expect(page).to have_current_path "/users/sign_in"
    fill_in "user_email", with: "test1@example.com"
    fill_in "user_password", with: "foobar"
    click_button "ログイン"
    expect(page).to have_content "ログインしました"
    expect(page).to have_current_path "/users/#{user.id}"
    expect(page).to have_content "投稿した口コミはありません。"
    click_link "いいねした口コミ"
    expect(page).to have_current_path "/users/#{user.id}/likes"
    expect(page).to have_content "いいねした口コミはありません。"

    expect{
    click_link "口コミ投稿"
    expect(page).to have_current_path "/posts/new"
    fill_in "post[university]", with: "東京大学"
    fill_in "post[department]", with: "理工学部"
    fill_in "post[major]", with: "応用機械工学科"
    fill_in "post[professor]", with: "佐藤"
    fill_in "post[detail]", with: "ホワイト研究室でした。"
    click_button "口コミを投稿する"
    }.to change(user.posts, :count).by(1)
    expect(page).to have_content "投稿が完了しました"
    expect(page).to have_current_path "/posts/#{post.id + 1}"
    click_link "マイページ"
    expect(page).to have_current_path "/users/#{user.id}"
    expect(page).not_to have_content "投稿した口コミはありません"
    expect(page).to have_content('ホワイト研究室でした')

    click_link "ゼミラボナビ"
    fill_in "q[university_cont]", with: "大阪"
    click_button "検索する"
    #expect{
      #find(".unlike-btn").click
    #}.to change(user.likes, :count).by(1) & change(post.likes, :count).by(1)
    find(".unlike-btn").click
    click_link "マイページ"
    click_link "いいねした口コミ"
    expect(page).not_to have_content('いいねした口コミはありません')
    expect(page).to have_content('大阪大学')
    #expect{
      #find(".like-btn").click
    #}.to change(user.likes, :count).by(-1) & change(post.likes, :count).by(-1)
    find(".like-btn").click
    visit current_path
    expect(page).to have_content('いいねした口コミはありません。')

    click_link "自分が投稿した口コミ"
    within ".card" do
      click_link "編集する"
    end
    fill_in "post[university]", with: "早稲田大学"
    fill_in "post[department]", with: "創造理工学部"
    fill_in "post[major]", with: "情報工学科"
    fill_in "post[professor]", with: "鈴木"
    fill_in "post[detail]", with: "ホワイト研究室ではなかったです。"
    click_button "口コミを編集する"
    expect(page).to have_content('編集が完了しました')
    click_link "マイページ"
    expect(page).to have_content('早稲田大学')
    expect(page).to have_content('創造理工学部')
    expect(page).to have_content('情報工学科')
    expect(page).to have_content('鈴木')
    expect(page).to have_content('ホワイト研究室ではなかったです')

    visit root_path
    fill_in "q[university_cont]", with: "早稲田大学"
    fill_in "q[department_cont]", with: "創造理工学部"
    fill_in "q[major_cont]", with: "情報工学科"
    fill_in "q[professor_cont]", with: "鈴木"
    click_button "検索する"
    expect(page).to have_content('早稲田大学')
    expect(page).to have_content('創造理工学部')
    expect(page).to have_content('情報工学科')
    expect(page).to have_content('鈴木')
    expect(page).to have_content('ホワイト研究室ではなかったです')

    click_link "マイページ"
    #expect{
      #click_link "削除する"
      #page.driver.browser.switch_to.alert.accept
    #}.to change(user.posts.count).by(-1)
    click_link "削除する"
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('投稿した口コミはありません')
    expect(page).not_to have_content('ホワイト研究室ではなかったです')

    visit root_path
    fill_in "q[university_cont]", with: "早稲田大学"
    click_button "検索する"
    expect(page).to have_content "該当する口コミは見つかりませんでした"
    expect(page).not_to have_content "検索結果"

  end

end
