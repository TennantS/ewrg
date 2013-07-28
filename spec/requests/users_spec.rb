require 'spec_helper'

describe "Users" do
  describe "Signing up as a user" do
    it "should display a success message" do
      visit signup_path
      fill_in "user_email", with: "some@email.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      expect { click_button("Create User") }.to change(User, :count).by(1)
    end
  end
end