require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { FactoryBot.create(:question) }

  it 'is valid with title, description and user_id' do
    expect(question).to be_valid
  end

  it 'is invalid without title' do
    question.update(title: nil)
    expect(question).to be_invalid
  end

  it 'is invalid without description' do
    question.update(description: nil)
    expect(question).to be_invalid
  end

  it 'is invalid without user_id' do
    question.update(user_id: nil)
    expect(question).to be_invalid
  end
end
