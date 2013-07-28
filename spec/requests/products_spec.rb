require 'spec_helper'

describe "Products" do

  describe "Creating a new product" do
    it "has the correct content on the page after creating a product" do
      visit new_product_path
      fill_in "product_name", with: "Some Fake Name"
      fill_in "product_description", with: "Some Fake Description"
      fill_in "product_part_number", with: "Some Fake Part Number"
      expect { click_button("Create Product") }.to change(Product, :count).by(1)
      page.should have_content "Some Fake Name"
      page.should have_content "Product was created successfully"
    end
  end

  describe "Editing an existing product" do
    let!(:product) { FactoryGirl.create(:product) }
    it "should have the updated content on the page after editing" do
      visit edit_product_path(product)
      fill_in "product_name", with: "Some New Fake Name"
      click_button "Update Product"
      product.reload
      page.should have_content product.name
      page.should have_content "Product was updated successfully"
    end
  end

  describe "Destroying an existing product" do
    let!(:product) { FactoryGirl.create(:product) }

    it "should delete the product" do
      visit edit_product_path(product)
      expect { click_link("Delete Product") }.to change(Product, :count).by(-1)
      page.should have_content "Product was deleted successfully"
    end

  end

  describe "Visiting the all products page" do
    10.times { FactoryGirl.create(:product) }
    it "should have all the products" do
      visit products_path
      Product.all.each do |p|
        page.should have_content p.name
      end
    end
  end
end