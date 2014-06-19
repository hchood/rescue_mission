require 'rails_helper'

feature "user views list of questions", %Q{
    As a user
    I want to view recently posted questions
    So that I can help others
  } do

# Acceptance Criteria

# - I must see the title of each question
# - I must see questions listed in order, most recently posted first

  scenario "views all questions" do
    # SETUP:
    # create an array of 3 questions, each of which is
    # created at a different time so I can test that
    # the ordering of questions on the page is correct.
    questions = []

    3.times do |i|
      # create some set of attributes that'll be unique to this question
      attrs = {
        title: "Question #{i}: I have a really long question about Rails",
        description: %Q{
          Description #{i}:
          What, you think this isn't real just because of all the vampires,
          and demons, and ex-vengeance demons, and the sister that used to
          be a big ball of universe-destroying energy? It was the pioneer
          days; people had to make their own interrogation rooms. Out of
          cornmeal.
        }
      }

      question = Question.create(attrs)
      # Rails provides some nice time helpers like 3.minutes.ago, 5.hours.from_now, etc.:
      # http://api.rubyonrails.org/v2.3.8/classes/ActiveSupport/CoreExtensions/Numeric/Time.html
      question.created_at = i.hours.ago
      question.save
      questions << question
    end

    visit questions_path

    # EXPECTATIONS:
    # test that the page contains the title & description
    # for each question
    questions.each do |question|
      expect(page).to have_content question.title
      expect(page).to have_content question.description
    end

    # test that the most recently created post appears first
    # using a gem called orderly, which provides the appear_before helper
    # https://github.com/jmondo/orderly
    expect(questions[0].title).to appear_before questions[2].title
  end
end
