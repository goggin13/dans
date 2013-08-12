class Blog < ActiveRecord::Base
  attr_accessible :content, :title, :published

  validates_presence_of :content
  validates_presence_of :title
  validates_inclusion_of :published, in: [true, false]

  def summary(length=250)
    content[0, length]
  end
end
