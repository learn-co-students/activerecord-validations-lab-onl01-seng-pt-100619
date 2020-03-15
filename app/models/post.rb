class Post < ActiveRecord::Base
    validates :title, presence: true, uniqueness: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    
end
