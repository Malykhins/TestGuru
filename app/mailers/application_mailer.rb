class ApplicationMailer < ActionMailer::Base
  default from: %{ "TestGuru" <s.a.malyhin@gmail.com> }
  layout 'mailer'
end
