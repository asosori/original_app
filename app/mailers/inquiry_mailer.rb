class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: Rails.application.credentials[:username],
      to:   Rails.application.credentials[:username],
      subject: 'お問い合わせ通知'
    )
  end
end
