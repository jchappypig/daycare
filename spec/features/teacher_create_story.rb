require '../spec_helper'

feature 'Create/Update/Delete Stories' do
  background do
    @outcome_items = FactoryGirl.create_list(:outcome_item, 3)
  end

  scenario 'teacher create a story' do
    new_story_content = 'Today is a lovely day. Children are playing sands together.'
    selected_outcome = @outcome_items.first

    visit new_story_path
    expect(page).to have_content 'New Story'

    fill_in 'story_content', with: new_story_content
    find(outcome_item_selector(selected_outcome)).set(true)

    click_on 'Create Story'

    expect(page).to have_content 'Story for ' + Date.today().to_s
    expect(page).to have_content new_story_content
    expect(page).to have_content selected_outcome.description
  end

  scenario 'teacher update a story' do
    updated_story_content = 'Tomorrow we will have activities, please all wear green.'
    previous_selected_outcome = @outcome_items.first
    new_selected_outcome = @outcome_items.last
    story = create(:story)
    story.outcomes << Outcome.create(outcome_item: previous_selected_outcome)

    visit story_path(id: story.id)

    expect(page).to have_content 'Story for ' + Date.today().to_s
    click_on 'Edit'

    expect(page).to have_content 'Edit Story'
    expect(find(outcome_item_selector(previous_selected_outcome))).to be_checked

    fill_in 'story_content', with: updated_story_content
    find(outcome_item_selector(previous_selected_outcome)).set(false)
    find(outcome_item_selector(new_selected_outcome)).set(true)
    click_on 'Update Story'

    expect(page).to have_content 'Story for ' + Date.today().to_s
    expect(page).to have_content updated_story_content
    expect(page).to have_content new_selected_outcome.description
    expect(page).to_not have_content previous_selected_outcome.description
  end

  scenario 'teacher delete a story' do
    story = create(:story)
    visit story_path(id: story.id)

    click_on 'Delete'
    page.driver.browser.switch_to.alert.accept if Capybara.current_driver == :selenium

    expect(current_path).to eq stories_path
    expect(Story.find_by(id: story.id)).to be_nil
  end

  private

  def outcome_item_selector(selected_outcome)
    '#story_outcomes_[value="' + "#{selected_outcome.id}" +'"]'
  end
end
