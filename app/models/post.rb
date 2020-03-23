class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :clickbait
    #validates :title, inclusion: {in: ["Won't Believe", "Secret", "Top [number]", "Guess"]}

    private

    def clickbait
        #strings = ["Won't Believe", "Secret", "Top", "Guess"]
        #if category.include?("Won't Believe") #, "Secret", "Top", "Guess"
        if !category.match? /Won't\sBelieve|Secret|Top\s\d|Guess/
            errors.add(:title, "has to be clickbait")
        end
    end

end
