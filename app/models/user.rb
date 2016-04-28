# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  first_name       :string
#  last_name        :string
#  email            :string
#  phone            :string
#  password_digest  :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  activation_token :string
#  active_status    :boolean          default("f")
#  reset_code       :string
#

class User < ActiveRecord::Base
  has_many :oauth_accounts
  has_many :orders
  has_many :addresses

  before_create :assign_token

  scope(
    :token_match,
    lambda do |id, token|
      where(id: id, activation_token: token)
    end
  )

  def assign_token
    self.active_status = false
    self.activation_token = [*"0".."9", *"a".."z", *"A".."Z"].sample(50).join
  end
end
