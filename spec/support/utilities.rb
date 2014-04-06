include ApplicationHelper

def sign_in (user, options = {})
  if options[:no_capybara]
    # sign in when not using capybara
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
  else
    visit signin_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end
end

RSpec::Matchers.define :have_alert_message do |type,message|
  match do |page|
    expect(page).to have_selector("div.alert.alert-#{type}", text:message)
  end
end

#RSpec::Matchers.define :have_h1_heading(page) do
#  expect(page).to have_selector('h1', text: heading)
#end
