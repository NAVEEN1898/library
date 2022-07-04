# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Book, type: :model do
  subject do
    described_class.new(name: 'Anything', author: 'as')
  end

  it 'is valid with valid attributes(book name)' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with valid attributes(author)' do
    expect(subject).to be_valid
  end
end
