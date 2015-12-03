class User < ActiveRecord::Base
	belongs_to :role

  has_many :repositories

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_default_role

  def admin?
    role == Role.find_by_name('admin')
  end

  def moderator?
    role == Role.find_by_name('moderator')
  end

  private

  def set_default_role
    self.role ||= Role.find_by_name('registered')
  end
end
