require 'rails_helper'

feature "user signs out", %Q{
    As a user
    I want to be able to sign out
    So that other users of my computer can't pretend to be me
  } do

# Acceptance Criteria

# - I must be able to sign out from any page

  scenario 'user is signed in' do
    user = User.create(
      provider: 'github',
      uid: '1234567',
      email: 'bob@bobloblawslawblog.biz'
      )

    # sign a user in
    set_omniauth(user)

    visit '/'
    click_on 'Sign in with GitHub'

    # sign out
    click_on 'Sign Out'

    expect(page).to have_content 'Sign in with GitHub'
    expect(page).to_not have_content 'Sign Out'
  end

  scenario 'user is not signed in'
end
