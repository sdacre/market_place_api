require 'rails_helper'

RSpec.describe Product, type: :model do
			before { @product = FactoryBot.build(:product) }

  	subject { @product }

  it { should validate_presence_of :title }
  it { should validate_presence_of :price }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  it { should validate_presence_of :user_id }

  it { should_not be_published }
  it { should belong_to :user }

  describe ".filter_by_title" do
    before(:each) do
      @product1 = FactoryBot.create :product, title: "A plasma TV"
      @product2 = FactoryBot.create :product, title: "Fastest Laptop"
      @product3 = FactoryBot.create :product, title: "CD player"
      @product4 = FactoryBot.create :product, title: "LCD TV"

    end

    context "when a 'TV' title pattern is sent" do
      it "returns the 2 products matching" do
        expect(Product.filter_by_title("TV")).to have(2).items
      end

      it "returns the products matching" do
        expect(Product.filter_by_title("TV").sort).to match_array([@product1, @product4])
      end
    end
  end
end



