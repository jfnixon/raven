# == Schema Information
#
# Table name: arts
#
#  id         :integer          not null, primary key
#  yubikey    :text
#  user_id    :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  le_count   :integer
#

require 'spec_helper'

describe Art do
  pending "add some examples to (or delete) #{__FILE__}"
end
