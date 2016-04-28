# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  comment    :string
#  rating     :integer
#  product_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#

class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  validates :comment, :rating, presence: true
end
