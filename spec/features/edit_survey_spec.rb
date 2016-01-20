require 'rails_helper'

describe 'Edit Survey' do
  before(:each) do
    visit '/'
    click_link 'New Survey'

    fill_in "Name", :with => "Math Surveys"
    click_link "Add Question"
    fill_in "Question", :with => "What is 2 + 2?"
    click_link "Add Answer"
    fill_in "Answer", :with => "2"
    click_button "Create Survey"

    visit '/'
  end

  it 'should edit an existing survey', :js => true do
    expect(page).to have_selector(:link_or_button, "Math Surveys")

  end
end
