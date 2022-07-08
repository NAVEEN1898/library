# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Plan, type: :model do
  subject do
    described_class.new(plan_name: 'Anything', plan_description: 'asvvgghvnd')
  end

  it 'is valid with valid attributes(plan name)' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.plan_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a author' do
    subject.plan_description = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with valid attributes(plan description)' do
    expect(subject).to be_valid
  end
end
