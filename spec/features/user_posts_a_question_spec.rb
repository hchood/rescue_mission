require 'rails_helper'

feature "user posts a question", %Q{
  As a user
  I want to post a question
  So that I can receive help from others
} do

# Acceptance Criteria:
# - I must provide a title that is at least 40 characters long
# - I must provide a description that is at least 150 characters long
# - I must be presented with errors if I fill out the form incorrectly

  scenario "user provides required attributes" do
    attrs = {
      title: "I have a really long question about Rails",
      description: %Q{
        Flannel you probably haven't heard of them Helvetica
        PBR&B VHS. Wes Anderson kale chips authentic pour-over
        four loko, plaid pug meggings umami crucifix Shoreditch
        selvage Portland cray. PBR pug cliche tote bag, hashtag
        hoodie chambray lomo fanny pack Pitchfork deep v butcher.
        Selfies lomo shabby chic literally, hashtag fap brunch.
        Cliche keffiyeh ethical post-ironic, 3 wolf moon messenger
        bag Godard stumptown High Life pop-up YOLO letterpress Pinterest cornhole.
      }
     }

    prev_count = Question.count

    visit new_question_path

    fill_in 'Title', with: attrs[:title]
    fill_in 'Description', with: attrs[:description]
    click_on 'Create Question'

    expect(page).to have_content "Success!"
    expect(page).to have_content attrs[:title]
    expect(page).to have_content attrs[:description]
    expect(Question.count).to eq prev_count + 1
  end

  scenario "missing required attributes" do
    prev_count = Question.count

    visit new_question_path
    click_on 'Create Question'

    expect(page).to have_content "Error!"
    expect(page).to have_content "can't be blank"
    expect(page).to have_content "Post a question!"
    expect(Question.count).to eq prev_count
  end

  scenario "title and description too short" do
    prev_count = Question.count

    visit new_question_path
    fill_in 'Title', with: 'rails'
    fill_in 'Description', with: 'something'
    click_on 'Create Question'

    expect(page).to have_content "Error!"
    expect(page).to have_content "too short"
    expect(page).to have_content "Post a question!"
    expect(Question.count).to eq prev_count
  end
end





