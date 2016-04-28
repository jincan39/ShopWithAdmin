# == Schema Information
#
# Table name: order_items
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  product_id :integer
#  quantity   :integer
#  size       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true
end
