# == Schema Information
#
# Table name: wishlists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Wishlist < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  scope(
    :user_products,
    lambda do |user_id|
      where(user_id: user_id).select("id", "product_id", "created_at")
    end
  )

  def exists?
    Wishlist.exists?(user_id: user_id, product_id: product_id)
  end
end
