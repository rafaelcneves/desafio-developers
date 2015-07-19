class SendMailsWorker
  include Sidekiq::Worker

  def perform(id)
    candidate = Candidate.find(id)
    return if candidate.blank?

    mails = []
    mails << "front_end" if candidate.front_end?
    mails << "back_end" if candidate.back_end?
    mails << "mobile" if candidate.mobile?
    mails << "generic" if mails.blank?

    mails.each do |mail|
      CandidateMailer.try(mail, candidate).deliver_now
    end
  end
end
