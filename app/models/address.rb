# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string
#  email      :string
#  address    :string
#  landmark   :string
#  gender     :string
#  phone      :string
#  state      :string
#  city       :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Address < ActiveRecord::Base
  belongs_to :user
  has_many :orders

  validates :name, :address, :phone, :state, :city, presence: true
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  }
end
