class Twitter < ActiveRecord::Base
  validates :content, presence: true
end