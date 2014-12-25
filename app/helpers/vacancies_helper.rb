module VacanciesHelper
  def select_options_owner
    User.where(role: Hash[User::ROLES.map.with_index.to_a][:hr]).map { |user| [user.name, user.id] }
  end

  def select_options_spoken_english
    options = {}
    (I18n.t 'vacancies.reply.english.spoken_levels').each do |key, value|
      options[value] = key if (0..Reply::SPOKEN_ENGLISH_LEVELS - 1).include? key.to_i
    end
    options_for_select options, 1
  end

  def contact_type_icon type
    {
      'phone' => 'phone',
      'email' => 'envelope',
      'skype' => 'skype'
    }[type]
  end
end