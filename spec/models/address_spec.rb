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

require "rails_helper"

RSpec.describe Address, type: :model do
  subject { create :address }

  it { is_expected.to be_valid }

  it { should validate_presence_of :name }

  it { should validate_presence_of :address }

  it { should validate_presence_of :phone }

  it { should validate_presence_of :city }

  it { should validate_presence_of :state }

  it { should have_many(:orders) }

  it { should belong_to(:user) }
end
