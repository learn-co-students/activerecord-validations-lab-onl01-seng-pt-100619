class TitleValidator < ActiveModel::Validator 
    def validate(record)
        if !record.title.nil? && !record.title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
          record.errors[:title] << "error!"
    end 
end 
end 

