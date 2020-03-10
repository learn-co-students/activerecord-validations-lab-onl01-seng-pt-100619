class PostValidator < ActiveModel::Validator
  def validate(record)
    if record.title && !record.title.match(/Won't Believe| Top [\d*]|Secret| Guess/)
      record.errors.add(:title, "Not click bait enough")
    end
  end
end