# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  author     :text
#  image      :text
#  signing_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  le_max     :integer
#  le_desc    :string(255)
#  title      :string(255)
#

require 'spec_helper'

describe Book do
  pending "add some examples to (or delete) #{__FILE__}"
end
