class Post < ActiveRecord::Base
    validate :title_sufficient_clickbait 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }

    def title_sufficient_clickbait
        if !title.present? || !title.include?("Won't Believe"|| "Secret" || "Top [number]" || "Guess")
            errors.add(:title,"Not sufficiently clickbait-y")
        end 
    end 
end
