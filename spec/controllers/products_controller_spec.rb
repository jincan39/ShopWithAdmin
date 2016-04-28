require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  let(:user) { create(:regular_user) }
  before(:all) do
    @product_one = create(:product, name: "testproduct1")
    @product_two = create(:product, name: "testproduct2")
  end
  after(:all) { DatabaseCleaner.clean_with(:truncation) }

  describe "making a review" do
    it "renders show template" do
      login(user)
      post :rate, title: "Nice one",
                  comment: "packaging to nice",
                  rating: 2,
                  product_id: @product_one.id,
                  format: :js

      expect(@product_one.reviews.last.title).to eq "Nice one"
    end
  end
end
