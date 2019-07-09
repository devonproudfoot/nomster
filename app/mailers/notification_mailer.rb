class NotificationMailer < ApplicationMailer
  default from: "no-reply@nomsterapp.com"

  def comment_added
    mail(to: "proudfoot.devon@gmail.com", subject: "A comment has been added to your court!")
  end
end
