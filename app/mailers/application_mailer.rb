class ApplicationMailer < ActionMailer::Base
  default from: 'secret-santa-flo@app.com'
  layout 'mailer'
end
