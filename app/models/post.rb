class Post < ActiveRecord::Base

  belongs_to :user, counter_cache: true
  has_many :comments

  validates :text, :title, presence: true

  attr_accessible :text, :title
end
