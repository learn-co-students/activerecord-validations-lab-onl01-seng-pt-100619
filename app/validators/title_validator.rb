class TitleValidator < ActiveModel::Validator
    def validate(record)
        arr = ["Won't Believe", "Secret", "Guess"]
            if !arr.any? {|a| record.title.include?(a)}
                record.errors[:title] << "Not clickbaity enough!"
            end
    end
end