require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:answer) { FactoryBot.create(:answer) }

  it 'is valid with for_example, body, and user' do
    expect(answer).to be_valid
  end

  it 'is invalid without for_example' do
    answer.update(for_example: nil)
    expect(answer).to be_invalid
  end

  it 'is invalid without description' do
    answer.update(description: nil)
    expect(answer).to be_invalid
  end

  it 'is invalid without user_id' do
    answer.update(user_id: nil)
    expect(answer).to be_invalid
  end
end
