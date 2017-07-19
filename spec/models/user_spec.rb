require 'rails_helper'

RSpec.describe User do
  let(:james) { User.find_by(email: 'james.kiefner@gmail.com') }
  let(:amelia){ User.find_by(email: 'amelia.earheart@gmail.com') }

  it 'should be have one globe' do
    expect(james.globe).not_to eq(nil)

    james.globe = nil
    expect(james.valid?).to eq(false)
  end

  it 'should have a present name, between 2 and 55 char.' do
    james.first_name = '    '
    expect(james.valid?).to eq(false)
    james.first_name = 'James'
    expect(james.valid?).to be(true)

    james.last_name = 'asdf' * 55
    expect(james.valid?).to eq(false)
    james.last_name = 'James'
    expect(james.valid?).to eq(true)
  end

  it 'should have a unique, valid email, between 7 and 255 char.' do
    james.email = 'amelia.EARHEART@gmail.com'
    expect(james.valid?).to eq(false)
    james.email = 'a@s.c'
    expect(james.valid?).to eq(false)
    james.email = '____'
    expect(james.valid?).to eq(false)
  end

  it 'should have a description' do
    james.description = ''
    expect(james.valid?).to eq(false)
    james.description = nil
    expect(james.valid?).to eq(false)
  end

  it 'has a min password 6 char password' do
    james.password = '12345'
    expect(james.valid?).to eq(false)

  end
end