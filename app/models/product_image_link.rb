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

class ProductImageLink < ActiveRecord::Base
  belongs_to :product
  validates :link_name, presence: true
end
