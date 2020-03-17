class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Non-Fiction Fiction) }
    validate :clickbait
  
    def clickbait
      if !title.nil? && (!title.include?( "Won't Believe" || "Secret" || "Top [number]" || "Guess"))
        errors.add(:title, "Category is not included in the list")
      end
    end
end
