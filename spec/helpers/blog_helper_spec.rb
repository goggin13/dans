require 'spec_helper'

describe BlogsHelper do
  describe "blog_path" do
    it "should return an anchor tag with the right URL" do
      blog = build(:blog, title:"my title", id: 1)
      html = "<a href=\"/blogs/1/my-title\">my title</a>"
      helper.link_to_blog(blog).should == html
    end
  end
end
