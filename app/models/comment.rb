class Comment < ActiveRecord::Base

  belongs_to :user, counter_cache: true
  belongs_to :post, counter_cache: true

  validates :text, presence: true

  attr_accessible :text
end
