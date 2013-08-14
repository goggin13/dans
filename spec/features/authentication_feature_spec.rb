require 'spec_helper'

describe "authentication" do
  describe "login form" do
    it "is linked to from the home page" do
      visit ''
      page.should have_xpath "//a[@href='/users/sign_in']"
    end
    it "is not linked to from the home page if a user is logged in"
  end
  describe "logging in" do
    it "shows you a failure message on invalid credenticals"
    it "reloads the page with a success message on login"
  end
end
