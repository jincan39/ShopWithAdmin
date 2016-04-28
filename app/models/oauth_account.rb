# == Schema Information
#
# Table name: oauth_accounts
#
#  id            :integer          not null, primary key
#  provider      :string
#  uid           :string
#  oauth_secret  :string
#  oauth_token   :string
#  oauth_expires :datetime
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class OauthAccount < ActiveRecord::Base
  belongs_to :user
end
