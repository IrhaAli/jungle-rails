require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      first_name: 'first_name',
      last_name: 'last_name',
      email: 'Email@gmail.com',
      password: '12345678',
      password_confirmation: '12345678'
    )
  end

  describe 'Validations' do
    it 'sucessfully create product provided all fields' do
      expect(subject).to be_valid
    end
    it 'validate passwords are the same' do
      subject.password_confirmation = '87654321'
      expect(subject).to_not be_valid
    end
    it 'validate first name is present' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
    it 'validate last name is present' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
    it 'validate quantity is present' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it 'email must be case-insensitive for signup' do
      User.create(
        first_name: 'first_name',
        last_name: 'last_name',
        email: 'EMAIL@gmail.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
      subject.save
      expect(subject).to_not be_valid
    end
    it 'password must have minimum length' do
      subject.password = '123'
      subject.password_confirmation = '123'
      expect(subject).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      subject.save
    end
    it 'password matches' do
      expect(User.authenticate_with_credentials('email@gmail.com', '12345678')).to eq subject
    end
    it 'email field with whitespace still valid login' do
      expect(User.authenticate_with_credentials('  email@gmail.com  ', '12345678')).to eq subject
    end
    it 'email verification is case-insensitive' do
      expect(User.authenticate_with_credentials('EMAIL@gmail.com', '12345678')).to eq subject
    end
  end
end
