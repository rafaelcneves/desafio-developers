class CandidateMailer < ApplicationMailer
  def front_end_mail(candidate)
    mail(to: candidate.email, subject: I18n.t("mail.subject"))
  end

  def back_end_mail(candidate)
    mail(to: candidate.email, subject: I18n.t("mail.subject"))
  end

  def mobile_mail(candidate)
    mail(to: candidate.email, subject: I18n.t("mail.subject"))
  end

  def generic_mail(candidate)
    mail(to: candidate.email, subject: I18n.t("mail.subject"))
  end
end
