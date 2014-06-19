require 'rails_helper'

feature "user views a question's details", %Q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question
} do

  # Acceptance Criteria

  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description

  scenario "views a question's details" do
    attrs = {
      title: "I have a really long question about Rails",
      description: %Q{
        What, you think this isn't real just because of all the vampires,
        and demons, and ex-vengeance demons, and the sister that used to
        be a big ball of universe-destroying energy? It was the pioneer
        days; people had to make their own interrogation rooms. Out of
        cornmeal. Frankly, it's ludicrous to have these interlocking bodies
      }
    }

    question = Question.create(attrs)

    visit questions_path
    click_on question.title

    expect(page).to have_content question.title
    expect(page).to have_content question.description
  end
end
