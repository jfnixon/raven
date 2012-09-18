# == Schema Information
#
# Table name: signings
#
#  id         :integer          not null, primary key
#  image      :text
#  greeting   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Signing < ActiveRecord::Base
  attr_accessible :greeting, :image
end
