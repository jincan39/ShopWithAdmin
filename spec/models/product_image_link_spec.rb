# == Schema Information
#
# Table name: product_image_links
#
#  id         :integer          not null, primary key
#  link_name  :string
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe ProductImageLink, type: :model do
  let(:image_link) { build(:product_image_link) }

  context "when initializing product image links" do
    it "is successful when all arguments are correct" do
      expect(image_link).to be_valid
    end

    it "fails when arguments are incorrect" do
      image_link.link_name = nil
      expect(image_link).to be_invalid
    end
  end
end
