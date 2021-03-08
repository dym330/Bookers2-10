class DailyMailer < ApplicationMailer

  def send_mail(user)
    @user = user
    mail(subject: '確認メール',to: @user.email, from: "test@example.com")
  end

  def users_send_mail
    @users = User.all
    @users.each do |user|
      DailyMailer.send_mail(user).deliver_now
    end
    # mail to: "webcamptest@gmail.com"
  end
end
