require 'spec_helper'

describe "about page" do
  it "works" do
    visit "/pages/about"
    page.should have_content "About"
  end
end
