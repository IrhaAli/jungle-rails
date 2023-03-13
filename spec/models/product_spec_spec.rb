require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    subject do
      Product.new(
        name: 'test_product',
        price: 123,
        quantity: 321,
        category: Category.new(name: 'test_category')
      )
    end
    it 'sucessfully create product provided all fields' do
      expect(subject).to be_valid
    end
    it 'validate name is present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'validate price is present' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end
    it 'validate quantity is present' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
    it 'validate category is present' do
      subject.category = nil
      expect(subject).to_not be_valid
    end
  end
end
