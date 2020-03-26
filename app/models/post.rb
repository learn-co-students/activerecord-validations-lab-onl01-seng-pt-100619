class Post < ActiveRecord::Base
    validates :title, presence: true, on: :create
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait? #use validate for method of our own

  def clickbait?
    array = ["won't believe", "secret", "guess", "top", "0", "1",  "2", "3", "4", "5", "6", "7", "8", "9"]

    if self.title 
      click_title = self.title.downcase 
      if array.any?{|i| click_title.include?(i)}
        return true
      else
        errors.add(:title, "must be clickbait")
      end
    else
      false
    end

  end
    
end
