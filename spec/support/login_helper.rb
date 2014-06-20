module LoginHelper
  def set_omniauth(user)
    # tell OmniAuth to redirect back to callback path immediately
    OmniAuth.config.test_mode = true

    # create a 'fake' auth_hash
    auth_hash = {
      provider: user.provider,
      uid: user.uid,
      email: user.email
    }

    # create the mock
    OmniAuth.config.add_mock(:github, auth_hash)
  end
end
