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

    it "only shows published blogs" do
      create(:blog, content: "a" * 1000, published: false)
      create(:blog, content: "b" * 1000, published: false)
      visit ''
      page.should_not have_content "a" * 100
      page.should_not have_content "a" * 100
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

    it "shows an edit blog link for each blog for admins" do
      blogs = (0..9).map { create(:blog) }
      user = create(:admin_user)
      sign_in user
      visit ''
      blogs.each { |b| page.should have_link "Edit", href: "/blogs/#{b.id}/edit" }
    end

    it "does not show an edit link for non admins" do
      blogs = (0..9).map { create(:blog) }
      visit ''
      page.should_not have_link "Edit"
    end

    it "has a like me on facebook button for the first blog"
  end

  describe "edit" do
    it "redirects for non-admins" do
      blog = create(:blog)
      user = create(:user)
      sign_in user
      visit edit_blog_path(blog)
      page.should have_content "You are not authorized at"
    end

    it "does not redirects for admins" do
      blog = create(:blog)
      user = create(:admin_user)
      sign_in user
      visit edit_blog_path(blog)
      page.should have_content "Editing blog"
    end

    it "edits a blog" do
      blog = create(:blog)
      user = create(:admin_user)
      sign_in user
      visit edit_blog_path(blog)

      fill_in "Title", with: "a new title"
      fill_in "Content", with: "some new content"
      uncheck "Published"
      click_button "Update Blog"

      blog.reload
      blog.title.should == "a new title"
      blog.content.should == "some new content"
      blog.published.should be_false
    end

    it "defaults auto save to on"
    it "autosaves your work as you type"
    it "does not autosave if the box is not checked"
    it "shows a live preview as you type"
  end

  describe "new" do
    it "redirects for non-admins" do
      user = create(:user)
      sign_in user
      visit new_blog_path
      page.should have_content "You are not authorized at"
    end

    it "does not redirect admins" do
      user = create(:admin_user)
      sign_in user
      visit new_blog_path
      page.should have_content "New blog"
    end

    it "is linked to from the home page if an admin user is logged in" do
      user = create(:admin_user)
      sign_in user
      visit ''
      page.should have_link "New Blog"
    end

    it "is not linked to if a non admin is logged in" do
      user = create(:user)
      sign_in user
      visit ''
      page.should_not have_link "New Blog"
    end

    it "creates a new blog" do
      user = create(:admin_user)
      sign_in user
      visit new_blog_path
      fill_in "Title", with: "a new title"
      fill_in "Content", with: "Some content"
      check "Published"
      expect do
        click_button "Create Blog"
      end.to change(Blog, :count).by 1

      blog = Blog.first
      blog.title.should == "a new title"
      blog.content.should == "Some content"
      blog.published.should be_true
    end
  end

  describe "show" do
    it "has a like me on facebook button"
  end
end
