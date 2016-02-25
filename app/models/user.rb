class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tickets

  has_many :conversations, :foreign_key => :sender_id

  has_many :comments, :through => :tickets

  belongs_to :group_user
  belongs_to :customer

  after_create :create_default_conversation

  # serialize :roles, Array


  private

  # for demo purposes

  def create_default_conversation
    Conversation.create(sender_id: 1, recipient_id: self.id) unless self.id == 1
  end
end
