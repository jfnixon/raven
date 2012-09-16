# == Schema Information
#
# Table name: limited_editions
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  creator    :string(255)
#  yubi_key   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe LimitedEdition do
  pending "add some examples to (or delete) #{__FILE__}"
end
