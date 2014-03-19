require 'spec_helper'

describe StoriesController do

  let(:valid_attributes) { { 'content' => 'MyText' } }

  describe 'GET index' do
    it 'assigns all stories as @stories' do
      story = Story.create! valid_attributes
      get :index, {}
      assigns(:stories).should eq([story])
    end

    it 'assigns stories on specific date as @stories' do
      story = Story.create! valid_attributes
      get :index, {date: DateTime.now.utc}
      assigns(:stories).should eq([story])
    end

    it '@stories should not include stories on a different date' do
      story = Story.create! valid_attributes
      get :index, {date: Date.yesterday}
      assigns(:stories).should_not eq([story])
    end
  end

  describe 'GET show' do
    it 'assigns the requested story as @story' do
      story = Story.create! valid_attributes
      get :show, {:id => story.to_param}
      assigns(:story).should eq(story)
    end
  end

  describe 'GET new' do
    it 'assigns a new story as @story' do
      get :new, {}
      assigns(:story).should be_a_new(Story)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested story as @story' do
      story = Story.create! valid_attributes
      get :edit, {:id => story.to_param}
      assigns(:story).should eq(story)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Story' do
        expect {
          post :create, {:story => valid_attributes}
        }.to change(Story, :count).by(1)
      end

      it 'assigns a newly created story as @story' do
        post :create, {:story => valid_attributes}
        assigns(:story).should be_a(Story)
        assigns(:story).should be_persisted
      end

      it 'redirects to the created story' do
        post :create, {:story => valid_attributes}
        response.should redirect_to(Story.last)
      end

      it 'creates a new story with a collection of outcomes' do
        outcome_item1 = create(:outcome_item)
        outcome_item2 = create(:outcome_item)
        outcome_item3 = create(:outcome_item)
        post :create, {story: valid_attributes.merge({outcomes: [outcome_item1.id, outcome_item2.id, outcome_item3.id, 'invalidId']})}

        assigns(:story).outcomes.pluck(:outcome_item_id).should =~ [outcome_item1.id.to_s, outcome_item2.id.to_s, outcome_item3.id.to_s]
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved story as @story' do
        # Trigger the behavior that occurs when invalid params are submitted
        Story.any_instance.stub(:save).and_return(false)
        post :create, {:story => { 'content' => 'invalid value' }}
        assigns(:story).should be_a_new(Story)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Story.any_instance.stub(:save).and_return(false)
        post :create, {:story => { 'content' => 'invalid value' }}
        response.should render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested story' do
        story = Story.create! valid_attributes
        Story.any_instance.should_receive(:update).with({ 'content' => 'MyText' })
        put :update, {:id => story.to_param, :story => { 'content' => 'MyText' }}
      end

      it 'assigns the requested story as @story' do
        story = Story.create! valid_attributes
        put :update, {:id => story.to_param, :story => valid_attributes}
        assigns(:story).should eq(story)
      end

      it 'redirects to the story' do
        story = Story.create! valid_attributes
        put :update, {:id => story.to_param, :story => valid_attributes}
        response.should redirect_to(story)
      end
    end

    describe 'with invalid params' do
      it 'assigns the story as @story' do
        story = Story.create! valid_attributes
        Story.any_instance.stub(:save).and_return(false)
        put :update, {:id => story.to_param, :story => { 'content' => 'invalid value' }}
        assigns(:story).should eq(story)
      end

      it "re-renders the 'edit' template" do
        story = Story.create! valid_attributes
        Story.any_instance.stub(:save).and_return(false)
        put :update, {:id => story.to_param, :story => { 'content' => 'invalid value' }}
        response.should render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested story' do
      story = Story.create! valid_attributes
      expect {
        delete :destroy, {:id => story.to_param}
      }.to change(Story, :count).by(-1)
    end

    it 'redirects to the stories list' do
      story = Story.create! valid_attributes
      delete :destroy, {:id => story.to_param}
      response.should redirect_to(stories_url)
    end
  end

end
