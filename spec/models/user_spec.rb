require 'rails_helper'

RSpec.describe User, type: :model do
  subject { 
    User.new(
      first_name: "Victoria",
      last_name: "Lee",
      email: "hello@email.com",
      password: "123",
      password_confirmation: "123"
    )
  }

  describe 'Validations' do
    it 'should create a new user' do
      expect(subject).to be_valid
      expect(subject.errors.full_messages).to be_empty
    end
    it 'should not create user without email' do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Email can't be blank"
    end
    it 'should not create user without first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "First name can't be blank"
    end
    it 'should not create user without last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Last name can't be blank"
    end
    it 'should not create user without password' do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Password can't be blank"
    end
    it 'should not create user without password confirmation' do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Password confirmation can't be blank"
    end
    it "should not create user if password and password confirmation don't match" do
      subject.password_confirmation = '321'
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "should not create user if email already exists (email is not case sensitive)" do
      subject_one = User.create(
          first_name: "Vic",
          last_name: "Lee",
          email: "HELLO@EMAIL.COM",
          password: "123",
          password_confirmation: "123"
        )
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Email has already been taken"
    end
    it "should not create user if password is too short" do
      subject.password = 'no'
      subject.password_confirmation = 'no'
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Password is too short (minimum is 3 characters)"
    end
  end
end
