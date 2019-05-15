class InquiryMailer < ApplicationMailer
  def send_mail_me(inquiry)
    @inquiry = inquiry
    mail(
      from: Rails.application.credentials[:username],
      to:   Rails.application.credentials[:username],
      subject: 'お問い合わせ通知'
    )
  end

  def send_mail_user(inquiry)
    @inquiry = inquiry
    mail(
      from: Rails.application.credentials[:username],
      to:   "#{@inquiry.email}",
      subject: 'お問い合わせを承りました。'
    )
  end
end
