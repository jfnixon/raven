# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  first_name             :string(255)
#  middle_name            :string(255)      default("")
#  last_name              :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :password_confirmation, :email_confirmation

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :email_confirmation, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :middle_name, :last_name
  
  # attr_accessible :title, :body
  
  # add in the Raven specific stuff
  has_many :arts
  validates :password, :presence => true
  validates :email, :presence => true, :uniqueness => true, :confirmation => true
  validates :email_confirmation, :presence => true, :on => :save
  
  def full_name
    first_name + " " + (middle_name.blank? ? " " : middle_name[0..0] + ". ") + last_name
  end
end
