# == Schema Information
#
# Table name: signings
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  greeting   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Signing < ActiveRecord::Base
  attr_accessible :greeting, :image
end
