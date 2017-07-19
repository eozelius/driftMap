require 'rails_helper'

RSpec.describe Waypoint do
  let(:amelia) { User.find_by(email: 'amelia.earheart@gmail.com') }
  let(:waypoint) { amelia.journeys.first.waypoints.first }

  it 'should be valid' do
    expect(waypoint.valid?).to eq(true)
  end

  it 'should have a date' do
    waypoint.date = 'asdf'
    expect(waypoint.valid?).to eq(false)
  end

  it 'should have a title' do
    waypoint.title = nil
    expect(waypoint.valid?).to eq(false)
  end

  it 'should have a description' do
    waypoint.description = 0
    expect(waypoint.valid?).to eq(false)
  end

  it 'should have a coverphoto' do
    waypoint.coverphoto = nil
    expect(waypoint.valid?).to eq(false)
  end

  it 'should 1 gallery' do
    #waypoint.gallery.create!(title: 'To be deleted',
    #                           description: 'To be deleted')
    #expect(count).to eq(waypoint.galleries.count)
    pending 'not sure how to implement this'
    expect(1).to eq(0)

  end

  it 'should have friends' do

  end

  it 'should have entries' do

  end

  it 'should be destroyed when the parent journey is destroyed' do

  end

  it 'should be geocoded.' do
  end

end