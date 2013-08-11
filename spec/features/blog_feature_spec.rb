require 'spec_helper'

describe "blog pages" do
  describe "index" do
    it "lists the entirety of the first blog entry" do
      create(:blog, content: "a" * 1000)
      create(:blog, content: "b" * 1000, created_at: Time.now.advance(years: -10))
      visit ''
      page.should have_content "a" * 1000
    end

    xit "lists subsequent blogs in chronological order" do
      create(:blog)
      create(:blog, content: "3" * 1000, created_at: Time.now.advance(years: 3))
      create(:blog, content: "1" * 1000, created_at: Time.now.advance(years: 1))
      create(:blog, content: "2" * 1000, created_at: Time.now.advance(years: 2))
      visit ''
    end

    it "shows only the summary for the next 10 blogs" do
      (0..9).each do |i|
        create(:blog, content: i.to_s * 1000, created_at: Time.now.advance(years: -1 * i))
      end
      visit ''
      page.should_not have_content "#{"0" * 250}..."
      (1..9).each do |i|
        page.should have_content "#{i.to_s * 250}..."
      end
    end

    it "shows an edit blog link for each blog" do
      blogs = (0..9).map { create(:blog) }
      visit ''
      blogs.each { |b| page.should have_link "Edit", href: "/blogs/#{b.id}/edit" }
    end

    it "does not show an edit link for non admins"
    it "has a like me on facebook button for the first blog"
  end

  describe "edit" do
    it "redirects for non-admins"
    it "creates a new blog"
    it "defaults auto save to on"
    it "autosaves your work as you type"
    it "does not autosave if the box is not checked"
    it "shows a live preview as you type"
  end

  describe "show" do
    it "has a like me on facebook button"
  end
end
