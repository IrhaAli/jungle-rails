require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject do
      User.new(
        first_name: 'first_name',
        last_name: 'last_name',
        email: 'email@gmail.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
    end
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
    it 'email must be case-insensitive' do
      another_user = User.new(
        first_name: 'first_name',
        last_name: 'last_name',
        email: 'EMAIL@gmail.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
      expect(another_user).to_not be_valid
    end
    it 'password must have minimum length' do
      subject.password = '123'
      subject.password_confirmation = '123'
      expect(subject).to_not be_valid
    end
  end
end
