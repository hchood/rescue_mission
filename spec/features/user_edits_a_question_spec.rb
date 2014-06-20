require 'rails_helper'

feature "user edits a question", %Q{
    As a user
    I want to edit a question
    So that I can correct any mistakes or add updates
  } do

# Acceptance Criteria

# - I must provide valid information
# - I must be presented with errors if I fill out the form incorrectly
# - I must be able to get to the edit page from the question details page
# - I must be signed in
# - I must be able to edit a question that I posted
# - I can't edit a question that was posted by another user

  context 'user is signed in' do
    context 'user is the question author' do
      scenario 'provides valid information'
      scenario 'provides invalid information'
    end

    context 'user is not the question author' do
      scenario 'cannot edit question' do
        # create my test objects
        author = User.create(
          provider: 'github',
          uid: '1234567',
          email: 'author@example.com'
          )
        user = User.create(
          provider: 'github',
          uid: '7654321',
          email: 'other_user@example.com'
          )

        question_attrs = {
          title: "I have a really long question about Rails",
          description: %Q{
            What, you think this isn't real just because of all the vampires,
            and demons, and ex-vengeance demons, and the sister that used to
            be a big ball of universe-destroying energy? It was the pioneer
            days; people had to make their own interrogation rooms. Out of
            cornmeal. Frankly, it's ludicrous to have these interlocking bodies
          },
          author: author
        }

        question = Question.create(question_attrs)

        # login a user

        set_omniauth(user)
        visit '/'
        click_on 'Sign in with GitHub'
        visit question_path(question)

        expect(page).to_not have_content 'Edit'
      end
    end
  end

  context 'user is not signed in' do
  end
end








