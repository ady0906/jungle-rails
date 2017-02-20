require 'rails_helper'
require 'product'
require 'category'

RSpec.describe Product, type: :model do
  context 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:category) }
  end

  context "description" do

    before do
      @guitarstuff = Category.create(name: 'Guitar stuff')
      @pianostuff = Category.create(name: 'Piano stuff')
    end

    it "should save a product correctly" do
      @slide = Product.create(
      name: 'Bottleneck slide',
      price: 15,
      quantity: 30,
      category: @guitarstuff
      )

      expect (Product.find(@slide.id)).to eq(@slide)
    end

  end






# describe 'Save product' do
#
#
#   before do
#     @category = Category.new(:name => 'Zbob')
#
#   context "given 4 valid parameters" do
#     it "saves the new product"
end
