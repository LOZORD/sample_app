include ApplicationHelper

def valid_signin(user)
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Sign in'
end

RSpec::Matchers.define :have_alert_message do |type,message|
  match do |page|
    expect(page).to have_selector("div.alert.alert-#{type}", text:message)
  end
end

#RSpec::Matchers.define :have_h1_heading(page) do
#  expect(page).to have_selector('h1', text: heading)
#end
