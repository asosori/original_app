require 'rails_helper'

RSpec.describe Post, type: :model do
  
  describe "there is a nil column on post model" do

    it "doesn't allow to make new post if university is nil" do
      post = FactoryBot.build(:university_is_nil)
      expect(post).not_to be_valid
    end
  
    it "doesn't allow to make a new post if department is nil" do
      post = FactoryBot.build(:department_is_nil)
      expect(post).not_to be_valid
    end
  
    it "doesn't allow to make a new post if major is nil" do
      post = FactoryBot.build(:major_is_nil)
      expect(post).not_to be_valid
    end
  
    it "doesn't allow to make a new post if professor is nil" do
      post = FactoryBot.build(:professor_is_nil)
      expect(post).not_to be_valid
    end
  
    it "doesn't allow to make a new post if detail is nil" do
      post = FactoryBot.build(:detail_is_nil)
      expect(post).not_to be_valid
    end
  end
  
  
  describe "verify another validation on post model" do
    before do
      @user = FactoryBot.create(:user)
    end
    it "doesn't allow to post over 2 posts per a user" do
      @user.posts.create(university: "大阪大学", department: "工学部", major: "電子情報工学科", professor: "舟木", detail: "教授はひねくれてます")
      new_post = @user.posts.build(university: "大阪大学", department: "工学部", major: "電子情報工学科", professor: "舟木", detail: "教授はひねくれてます")
      expect(new_post).not_to be_valid
    end
  end

end
