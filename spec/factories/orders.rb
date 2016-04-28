# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  order_number        :string
#  payment_method      :string
#  total_amount        :decimal(, )
#  user_id             :integer
#  address_id          :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  notification_params :text
#  status              :string           default("Pending")
#  transaction_id      :string
#  purchased_at        :datetime
#

FactoryGirl.define do
  factory :order do
    order_number Faker::Number.number(10).to_s
    payment_method ["pay-on-delivery", "paypal", "getmyshop-pay"].sample
    total_amount Faker::Commerce.price
    user factory: :regular_user
    address factory: :address

    factory :order_with_items do
      transient do
        order_item_count 4
      end

      after(:create) do |order, evaluator|
        create_list(:order_item, evaluator.order_item_count, order: order)
      end
    end
  end
end
