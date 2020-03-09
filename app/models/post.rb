class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait

    def clickbait
        arr = ["Won't Believe", "Secret", "Guess"]
        if title 
            if !arr.any? {|a| title.include?(a)}
                errors.add(:title, "Must Include Clickbait")
            end
        end
    end
end

# If the title does not contain "Won't Believe",
# "Secret", "Top [number]", or "Guess", the validator should add a validation.