class ApplicationMailer < ActionMailer::Base
  default from: %{ "TestGuru" <s.malyhin@inbox.ru> }
  layout 'mailer'
end
