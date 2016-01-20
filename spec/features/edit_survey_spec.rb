require 'rails_helper'

describe 'Edit Survey' do
  before(:each) do
    visit '/'
    click_link 'New Survey'

    fill_in "Name", :with => "Math Survey"
    click_link "Add Question"
    fill_in "Question", :with => "What is 2 + 2?"
    click_link "Add Answer"
    fill_in "Answer", :with => "bacon"
    click_button "Create Survey"

    visit '/'
  end

  it 'should edit an existing survey', :js => true do
    expect(page).to have_selector(:link_or_button, "Math Survey")
    click_link "Math Survey"

    expect(page).to have_selector(:link_or_button, "Edit")
    click_link "Edit"

    fill_in "Question", :with => "What is 2 + 2??"
    click_link "Remove"
    click_link "Add Answer"
    fill_in "Answer", :with => "4"

    click_link "Add Question"

    within all('.qArea').last do
      fill_in ('Question'), :with => 'What is 3 + 3?'
      click_link "Add Answer"
      fill_in ('Answer'), :with => '6'
    end

    click_button "Update Survey"

    expect(page).to have_content "What is 2 + 2??"
    expect(page).to have_content "4"
    expect(page).not_to have_content "bacon"
    expect(page).to have_content "What is 3 + 3?"
    expect(page).to have_content "6"

  end
end
