# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  author       :string(255)
#  title        :string(255)
#  image        :string(255)      default("")
#  edition_size :integer          default(1)
#  edition_desc :string(255)      default("")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Book do
  pending "add some examples to (or delete) #{__FILE__}"
end
