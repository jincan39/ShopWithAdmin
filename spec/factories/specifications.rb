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

FactoryGirl.define do
  factory :specification do
    key "Color"
    value "Marine blue"
    product_id 1
  end
end
