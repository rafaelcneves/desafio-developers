class CandidateMailer < ApplicationMailer
  def front_end(candidate)
    mail(to: candidate.email, subject: I18n.t("mail.subject"))
  end

  def back_end(candidate)
    mail(to: candidate.email, subject: I18n.t("mail.subject"))
  end

  def mobile(candidate)
    mail(to: candidate.email, subject: I18n.t("mail.subject"))
  end

  def generic(candidate)
    mail(to: candidate.email, subject: I18n.t("mail.subject"))
  end
end
