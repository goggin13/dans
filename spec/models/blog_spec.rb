require 'spec_helper'

describe Blog do
  it "requires a title" do
    blog = build(:blog)
    blog.title = nil
    blog.should_not be_valid
  end

  it "requires content" do
    blog = build(:blog)
    blog.content= nil
    blog.should_not be_valid
  end

  it "requires published" do
    blog = build(:blog)
    blog.published= nil
    blog.should_not be_valid
  end

  describe "summary" do
    it "includes the first 250 characters" do
      blog = build(:blog, content: "a" * 300)
      blog.summary.should == "a" * 250
    end
  end
end
