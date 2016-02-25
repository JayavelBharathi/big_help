class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :requester, :class_name => 'User'
  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :attachments, dependent: :destroy

  #status == Close New Open In-Progress Duplicate Invalid

  after_initialize :default_values

  private
    def default_values
      self.status ||= "New"
    end
end
