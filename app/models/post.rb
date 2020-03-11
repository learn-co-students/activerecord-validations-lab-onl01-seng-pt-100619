class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait

    def clickbait
        phrases = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        if title 
            if !phrases.any? { |phrase| title.include?(phrase) }
                errors.add(:title, "This is invalid.")
            end
        end
    end
end
