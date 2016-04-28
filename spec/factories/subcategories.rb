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

FactoryGirl.define do
  factory :subcategory do
    name { Faker::Commerce.product_name }
    category factory: :category

    factory :subcategory_with_products do
      transient do
        product_count 3
      end

      after(:create) do |subcategory, evaluator|
        create_list(
          :product,
          evaluator.product_count,
          subcategory: subcategory
        )
      end
    end
  end
end
