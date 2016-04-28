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

class Subcategory < ActiveRecord::Base
  has_many :products
  belongs_to :category

  validates :name, presence: true

  scope :get_unique, -> { select(:name).distinct }
  scope :by_category, ->(category) { where("category_id = ?", category) }
end
