class EnglishKnowledgeValidator < ActiveModel::Validator
  def validate record
    english = record.english
    if english[:spoken].to_s.empty?
      record.errors[:base] << I18n.t('errors.validation.reply.english.spoken.absent')
    else
      begin
        level = Integer english[:spoken]
        p level
        raise 'Invalid value' unless (0..Reply::SPOKEN_ENGLISH_LEVELS - 1).include? level
      rescue
        record.errors[:base] << I18n.t('errors.validation.reply.english.spoken.wrong_value', value_string: "0..#{ Reply::SPOKEN_ENGLISH_LEVELS - 1 }" )
      end
    end

    if english[:technical].to_s.empty?
      record.errors[:base] << I18n.t('errors.validation.reply.english.tech.absent')
    else
      begin
        level = Integer english[:technical]
        raise 'Invalid value' unless (1..Reply::TECH_ENGLISH_LEVELS ).include? level
      rescue
        record.errors[:base] << I18n.t('errors.validation.reply.english.tech.wrong_value', value_string: "1..#{ Reply::TECH_ENGLISH_LEVELS }" )
      end
    end
  end
end
