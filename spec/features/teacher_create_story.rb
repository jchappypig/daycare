require '../spec_helper'

feature 'Create/Update/Delete Stories' do
  scenario 'teacher create a story' do
    new_story_content = 'Today is a lovely day. Children are playing sands together.'

    visit new_story_path
    expect(page).to have_content 'New Story'

    fill_in 'story_content', with: new_story_content

    click_on 'Create Story'

    expect(page).to have_content 'Story for ' + Date.today().to_s
    expect(page).to have_content new_story_content
  end

  scenario 'teacher update a story' do
    updated_story_content = 'Tomorrow we will have activities, please all wear green.'
    story = create(:story)

    visit story_path(id: story.id)

    expect(page).to have_content 'Story for ' + Date.today().to_s
    click_on 'Edit'

    expect(page).to have_content 'Edit Story'
    fill_in 'story_content', with: updated_story_content

    click_on 'Update Story'

    expect(page).to have_content 'Story for ' + Date.today().to_s
    expect(page).to have_content updated_story_content
  end

  scenario 'teacher delete a story' do
    story = create(:story)
    visit story_path(id: story.id)

    click_on 'Delete'
    page.driver.browser.switch_to.alert.accept if Capybara.current_driver == :selenium

    expect(current_path).to eq stories_path
    expect(Story.find_by(id: story.id)).to be_nil
  end
end
