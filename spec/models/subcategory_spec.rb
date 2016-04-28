# == Schema Information
#
# Table name: subcategories
#
#  id          :integer          not null, primary key
#  name        :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "rails_helper"

RSpec.describe Subcategory, type: :model do
  let(:subcategory) { build(:subcategory) }

  context "when initializing product category" do
    it "is successful when all arguments are correct" do
      expect(subcategory).to be_valid
    end

    it "fails when arguments are incorrect" do
      subcategory.name = nil
      expect(subcategory).to be_invalid
    end
  end
end
