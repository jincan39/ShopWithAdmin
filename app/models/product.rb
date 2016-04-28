# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :text
#  quantity       :integer
#  code           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  brand          :string
#  size           :string
#  subcategory_id :integer
#  price          :integer
#

class Product < ActiveRecord::Base
  filterrific(
    available_filters: [
      :with_size,
      :with_low_price,
      :with_high_price,
      :with_subcategory,
      :with_category,
    ]
  )

  has_many :product_image_links
  has_many :specifications
  has_many :order_items
  has_many :reviews
  belongs_to :subcategory
  has_one :category, through: :subcategory

  before_create :generate_code

  validates :name, length: { maximum: 60 }, presence: true
  validates :price, presence: true, numericality: {
    only_integer: true,
    greater_than: 0
  }
  validates :description, presence: true
  validates :quantity, presence: true
  validates :brand, presence: true

  scope :with_low_price, lambda { |low_price|
    where("price >= ?", low_price)
  }
  scope :with_high_price, lambda { |high_price|
    where("price <= ?", high_price)
  }
  scope :with_size, lambda { |size|
    where(size: [*size])
  }
  scope :with_subcategory, lambda { |subcategory|
    Product.includes(:subcategory).joins(:subcategory).where(
      "subcategories.name  = ?", subcategory
    )
  }

  scope :with_category, lambda { |category|
    Product.includes(:category).joins(:category).where(
      "categories.name = ?", category
    )
  }

  scope :with_search, lambda { |term|
    where("lower(name) like ? or brand like ?",
          "%#{term.strip}%", "%#{term.strip}%")
  }

  def self.search(term)
    where("lower(name) like ? or brand like ?", "%#{term}%", "%#{term}%")
  end

  def generate_code
    generator = [*("A".."Z"), *("0".."9")].sample(8).join
    if Product.find_by_code(generator)
      generate_code
    else
      self.code = generator
    end
  end

  def size_values
    size.split(",").map(&:strip)
  end
end
