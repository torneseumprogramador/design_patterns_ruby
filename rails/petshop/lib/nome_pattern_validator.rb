class NomePatternValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        record.errors.add attribute, "O nome não pode ser vazio" if value.blank?
    end
end