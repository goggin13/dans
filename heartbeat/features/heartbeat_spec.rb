require 'spec_helper.rb'

describe "about page", type: :feature do

  before :all do
    Capybara.app_host = ENV['HEARTBEAT_DOMAIN'] || 'http://127.0.0.1:3000/'
  end

  describe "login, create and delete a blog" do
    it "should work" do
      visit 'http://127.0.0.1:3000/users/sign_in'
      fill_in "Email", with: 'goggin13@gmail.com'
      fill_in "Password", with: 'goggin13'
      click_button "Sign in"
      puts page.body
      page.should have_content "Signed in successfully"

      visit "http://127.0.0.1:3000/blogs/new"
      fill_in "Title", with: 'AutomatedTest'
      fill_in "Content", with: 'AutomatedTest'
      click_button "Create Blog"
      page.should have_content "Blog was successfully created."

      click_link "Edit"
      page.should have_content "Editing blog"
      click_link "Delete Blog"
      page.should have_content "Deleted AutomatedTest"

      click_link "Logout"
      page.should have_content "Signed out successfully."
    end
  end
end
