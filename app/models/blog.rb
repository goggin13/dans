class Blog < ActiveRecord::Base
  attr_accessible :content, :title, :published

  validates_presence_of :content
  validates_presence_of :title
  validates_inclusion_of :published, in: [true, false]

  def summary
    content[0, 250]
  end
end
