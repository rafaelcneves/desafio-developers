class ApplicationMailer < ActionMailer::Base
  default from: "dev@developers.com"
  layout 'mailer'

  before_action :set_locale

  def set_locale
    I18n.locale = "pt"
  end
end
