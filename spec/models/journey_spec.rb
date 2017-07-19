require 'rails_helper'

RSpec.describe Journey do
  let(:amelia) { User.find_by(email: 'amelia.earheart@gmail.com') }
  let(:journey) { amelia.journeys.first }

  it 'should be valid' do
    expect(journey.valid?).to eq(true)
  end

  it 'should have a title, description and coverphoto' do
    journey.title = ''
    journey.description = '   '
    journey.coverphoto = nil
    expect(journey.valid?).to eq(false)
  end

  it 'should be destroyed when owner User is destroyed' do
    journey.save

    count = Journey.count
    amelia.destroy
    expect(Journey.count).to eq(count - 1)
  end
end