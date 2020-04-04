class PostValidator < ActiveModel::Validator 
    def validate(post)
        if post.title.match?("Won't Believe" || "Secret" || "Top[number]" || "Guess")
            false
        end
    end 
end 