class InquiriesController < ApplicationController
  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    render template: "home/inquire" if @inquiry.invalid?
  end

  def thanks
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver_now
    else
      flash[:danger] = "再度お問い合わせ内容を入力してください"
      redirect_to home_inquiry_url
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:email, :message)
  end

end
