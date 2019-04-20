require 'rails_helper'

RSpec.describe User, type: :model do
    it "doesn't allow to create new user if the username is nil" do
        user = FactoryBot.build(:user, username: nil)
        expect(user).not_to be_valid
    end
    
    it "doesn't allow to create new user if the username's length is over 21 characters" do
        user = FactoryBot.build(:user, username: "aaaaabbbbbcccccddddde")
        expect(user).not_to be_valid
    end
end
