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

class Specification < ActiveRecord::Base
  belongs_to :product

  validates :key, length: { minimum: 2, maximum: 40 }
  validates :value, length: { minimum: 2 }
end
