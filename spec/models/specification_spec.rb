# == Schema Information
#
# Table name: specifications
#
#  id         :integer          not null, primary key
#  key        :string
#  value      :text
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe Specification, type: :model do
  let(:spec) { build(:specification) }

  context "when initialized" do
    it "is valid" do
      expect(spec).to be_valid
    end

    it "is invalid when length of 'key' is less than 2" do
      spec.key = "a"
      expect(spec).to be_invalid
    end

    it "is invalid when length of value is less than 2" do
      spec.key = "a"
      expect(spec).to be_invalid
    end
  end
end
