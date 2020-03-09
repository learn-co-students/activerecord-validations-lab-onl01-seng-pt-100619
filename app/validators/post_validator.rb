class PostValidator < ActiveModel::Validator
    def validate(record)
        if record.title && !record.title.match(/Won't Believe| Not [\d*]|Secret| Guess/)
            record.errors[:title] << "Title not clickbait-y"
        end
    end
end