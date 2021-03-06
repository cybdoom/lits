class CareerMailer < ActionMailer::Base
  default from: 'from@logic-it-solutions.com'

  def vacancy_created(vacancy)
    @vacancy = vacancy
    User.admins.each { |admin| mail(to: admin.email, subject: I18n.t('career.mail.vacancy_created.subject')) }
  end

  def reply_created(reply)
    @reply = reply
    mail(to: reply.vacancy.user.email, subject: I18n.t('career.mail.reply_created.subject'))
  end

end
