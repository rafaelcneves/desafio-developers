class ApplicationMailer < ActionMailer::Base
  default from: "rafael@nevesbox.com"
  layout 'mailer'

  before_action :set_locale

  def set_locale
    I18n.locale = "pt"
  end
end
