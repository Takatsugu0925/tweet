class Tweet < ActiveRecord::Base
    validates :content,    length: { maximum: 225 } 
    validates :content, presence: true
end
