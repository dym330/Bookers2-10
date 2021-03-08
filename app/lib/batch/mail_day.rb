class Batch::MailDay
  def self.send_mail
    DailyMailer.users_send_mail.deliver_now
    p "メール送信完了"
  end
end