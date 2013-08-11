require 'spec_helper'

describe "blog pages" do
  describe "login form" do
    it "is hidden by default"
    it "toggles open when clicked"
  end

  describe "logging in" do
    it "shows you a failure message on invalid credenticals"
    it "reloads the page with a success message on login"
  end
end
