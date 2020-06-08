ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: 'メールアドレス'#非表示,
  password: 'パスワード',#非表示
  authentication: 'plain',
  enable_starttls_auto: true
}