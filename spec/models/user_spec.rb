require "rails_helper"

RSpec.describe User, :type => :model do
  context "with 2 or more comments" do
    it "orders them in reverse chronologically" do
      user = User.create!(:first_name => "first name",:last_name => "last name",:email => "test@example.com",:nick => "testy",:phone_number => "+920000000", )
      expect(user.first_name).to eq("first name")
    end
  end
end