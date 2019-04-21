require 'rails_helper'

RSpec.describe Like, type: :model do
    before do
        @user = FactoryBot.create(:user)
        @post = @user.posts.create(university: "a", department: "b", major: "c", professor: "d", detail: "e")
    end
    
    it "makes sure if the validation of presence true functions" do
        like1 = @post.likes.build(user_id: nil)
        like2 = @user.likes.build(post_id: nil)
        expect(like1).not_to be_valid
        expect(like2).not_to be_valid
    end
    
    it "doesn't allow a certain user to like the same post over once" do
        Like.create(user_id: @user.id, post_id: @post.id)
        like = Like.new(user_id: @user.id, post_id: @post.id)
        expect(like).not_to be_valid
    end

    it "allows a certain user to like over 2 posts" do
        post = FactoryBot.create(:post)
        like1 = @user.likes.create(post_id: @post.id)
        like2 = @user.likes.build(post_id: post.id)
        expect(like2).to be_valid
    end

    it "allows 2 users to like the same post" do
        user2 = FactoryBot.create(:user)
        like1 = @user.likes.create(post_id: @post.id)
        like2 = user2.likes.build(post_id: @post.id)
        expect(like2).to be_valid
    end
    
end
