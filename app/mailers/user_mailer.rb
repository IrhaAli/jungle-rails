class UserMailer < ApplicationMailer
  def order_email
    @user = params[:user]
    @products = params[:products]
    @order = params[:order]
    mail(to: @user.email, subject: "Order ##{@order.id}")
  end

end
