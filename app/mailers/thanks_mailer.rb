class ThanksMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.thanks_mailer.signup.subject
  #
  def signup(user)
    @user = user

    mail to: @user.email
  end
end
