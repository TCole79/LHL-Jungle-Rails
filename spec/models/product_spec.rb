require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
  
        # validates :name, presence: true
        it "can save correctly with all required information entered" do 
          @category = Category.new(name: "Borat's Wardrobe")
          @product = Product.new(
            name: "Borat's Mankini",
            price: 100,
            quantity: 5,
            category: @category
          )
          @product.save
  
        expect(@product).to be_valid
        end

    # validates :name, presence: true
      it "is invalid if missing a name attribute" do 
        @category = Category.new(name: "Borat's Wardrobe")
        @product = Product.new(
          name: nil,
          price: 100,
          quantity: 5,
          category: @category
        )
        @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
      end
      

      # validates :price, presence: true
      it "is invalid if missing a price attribute" do
        @category = Category.new(name: "Borat's Wardrobe")
        @product = Product.new(
          name: "Borat's Mankini",
          price: nil,
          quantity: 5,
          category: @category
        )
        @product.save

        expect(@product).not_to be_valid
        expect(@product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"]) 
      end
      
      # validates :quantity, presence: true
      it "is invalid if missing a quantity attribute" do
        @category = Category.new(name: "Borat's Wardrobe")
        @product = Product.new(
          name: "Borat's Mankini",
          price: 100,
          quantity: nil,
          category: @category
        )
        @product.save

        expect(@product).not_to be_valid
        expect(@product.errors.full_messages).to eq(["Quantity can't be blank"]) 
      end

      # validates :category, presence: true
      it "is invalid if missing a category attribute" do
        @category = Category.new(name: "Borat's Wardrobe")
        @product = Product.new(
          name: "Borat's Mankini",
          price: 100,
          quantity: 5,
          category: nil
        )
        @product.save

        expect(@product).not_to be_valid
        expect(@product.errors.full_messages).to eq(["Category can't be blank"]) 
      end


  end

end
