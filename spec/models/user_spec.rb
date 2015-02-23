require 'rails_helper'

RSpec.describe User, type: :model do
  let(:first_name) { 'Bill' }
  let(:last_name) { 'Leeper' }
  let(:name) { 'Bill Leeper' }
  let(:user) {User.make first_name: first_name, last_name: last_name }

  # really just a sanity check
  it 'should validate required parameters' do
    expect(user.save).to eq(true)
  end

  it 'should join first and last name as name' do
    expect(user.name).to eq(name)
  end
end
