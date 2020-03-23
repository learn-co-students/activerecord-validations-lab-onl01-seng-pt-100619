class ClickbaitValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        unless value =~ /Won't\sBelieve|Secret|Top\s\d|Guess/
          record.errors[attribute] << ( "is not clickbait")
        end
    end
end