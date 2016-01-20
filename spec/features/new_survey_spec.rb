require 'rails_helper'

describe 'New Survey' do
  it 'should create a new survey', :js => true do
    visit '/'
    click_link 'New Survey'

    expect(page).to have_content "Name"
    expect(page).to have_selector("form input[name='survey[name]']")
    expect(page).to have_selector(:link_or_button, "Add Question")
    expect(page).to have_selector(:link_or_button, "Create Survey")

    fill_in "Name", :with => "Math Survey"
    click_link "Add Question"

    expect(page).to have_content "Remove Question"
    expect(page).to have_selector(:link_or_button, "Add Answer")
    fill_in "Question", :with => "What is 2 + 2?"
    click_link "Add Answer"

    expect(page).to have_content "Answer"
    expect(page).to have_selector(:link_or_button, "Remove")
    fill_in "Answer", :with => "2"

    click_button "Create Survey"

    expect(page).to have_content "Math Survey"
    expect(page).to have_content "What is 2 + 2"
    expect(page).to have_content "2"
  end
end
