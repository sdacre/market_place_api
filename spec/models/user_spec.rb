require 'rails_helper'

RSpec.describe User, type: :model do
			before { @user = FactoryBot.build(:user) }

  	subject { @user }

	it { should validate_presence_of(:email) }
	it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
	it { should validate_confirmation_of(:password) }
	it { should allow_value('example@domain.com').for(:email) }
  # we test the user actually respond to this attribute
  it { should respond_to(:auth_token) }
  .
  .
  .
  # we test the auth_token is unique
  it { should validate_uniqueness_of(:auth_token)}
end