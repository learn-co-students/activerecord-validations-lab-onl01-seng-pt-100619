class Post < ActiveRecord::Base
    
    # if non_clickbait
    #     validates :title, presence: true
    # end
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w( Fiction Non-Fiction) }
    validate :non_clickbait
    
    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
        ]
    
    def non_clickbait
        if CLICKBAIT_PATTERNS.none? {|word| word.match title}
            errors.add(:title, "must be clickbait")
        end
    end
   
end
