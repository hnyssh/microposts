class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :profile, length: { maximum: 1024 }
  validates :profile, presence: true, on: :update  # 更新時のみチェック
  validates :area, length: { maximum: 30 }
  validates :area, presence: true, on: :update  # 更新時のみチェック

  has_secure_password
end
