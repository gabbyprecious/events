# spec/models/events_spec.rb
require 'rails_helper'

# Test suite for the Item model
RSpec.describe Event, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:user) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:description) }
end