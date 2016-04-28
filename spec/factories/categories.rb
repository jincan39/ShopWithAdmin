# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :category do
    name { Faker::Commerce.product_name }

    factory :category_with_products do
      transient do
        subcategory_count 2
      end

      after(:create) do |category, evaluator|
        create_list(
          :subcategory_with_products,
          evaluator.subcategory_count,
          category: category
        )
      end
    end
  end
end
