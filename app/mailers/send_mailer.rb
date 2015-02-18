class SendMailer < ApplicationMailer
  def invitation(address, id)
    @address = address
    @id= id
    mail(to: address, subject: 'Welcome to My Awesome Site')
  end
end
