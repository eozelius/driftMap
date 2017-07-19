require 'rails_helper'

RSpec.describe Globe do
  let(:james) { User.find_by(email: 'james.kiefner@gmail.com') }
  let(:globe) { james.globe }

  it 'should have a lat greater than -91' do
    expect(globe.valid?).to eq(true)
    globe.lat = -91
    expect(globe.valid?).to eq(false)
  end

  it 'should have a lat less than 91' do
    globe.lat = 91
    expect(globe.valid?).to eq(false)
  end

  it 'should have lng greater than -181' do
    globe.lng = -181
    expect(globe.valid?).to eq(false)
  end

  it 'should have lng less than 181' do
    globe.lng = 181
    expect(globe.valid?).to eq(false)
  end

  it 'should be destroyed when User is destroyed' do
    count = Globe.count
    james.destroy!
    expect(Globe.count).to eq(count - 1)
  end
end