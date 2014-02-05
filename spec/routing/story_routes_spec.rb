require 'spec_helper'

describe 'routes for story' do
  describe 'stories/:date' do
    it 'should route to stories#index' do
      date = Date.today
      expect(get: "stories/#{date}").to route_to(controller: 'stories', action: 'index', date: date.to_s)
    end
  end

  describe 'stories/new' do
    it 'should route to stories#new' do
      expect(get: 'stories/new').to route_to(controller: 'stories', action: 'new')
    end
  end
end