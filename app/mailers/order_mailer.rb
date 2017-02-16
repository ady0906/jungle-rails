class OrderMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_recap(order)
    @order = order
    mail(to: order.email, subject: "Your recap for Order #{order.id}")
  end

end
