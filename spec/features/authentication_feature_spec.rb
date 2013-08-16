require 'spec_helper'

describe "authentication" do
  describe "login form" do
    it "is linked to from the home page" do
      visit ''
      page.should have_xpath "//a[@href='/users/sign_in']"
    end

    it "is not linked to from the home page if a user is logged in" do
      user = create(:admin_user)
      sign_in user
      visit ''
      page.should_not have_xpath "//a[@href='/users/sign_in']"
    end
  end

  describe "logging in" do
    it "shows you a failure message on invalid credenticals" do
      user = create(:admin_user, email: 'test@example.com', password: 'password')
      visit new_user_session_path
      fill_in "Email", with: 'test@example.com'
      fill_in "Password", with: 'WRONG-PASSWORD'
      click_button "Sign in"
      page.should have_content "Invalid email or password."
    end

    it "reloads the page with a success message on login" do
      user = create(:admin_user, email: 'test@example.com', password: 'password')
      visit new_user_session_path
      fill_in "Email", with: 'test@example.com'
      fill_in "Password", with: 'password'
      click_button "Sign in"
      page.should have_content "Signed in successfully"
    end
  end
end
