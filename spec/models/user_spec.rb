require 'spec_helper'

describe User do
  it { should have_fields(:name, :email) }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:email) }
end
