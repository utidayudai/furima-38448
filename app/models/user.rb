class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end
  validates :kana_last_name, presence: true
  validates :kana_first_name, presence: true
  validates :birthday, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  KATAKANA_REGEX = /\A([ァ-ン]|ー)+\z/.freeze
  validates_format_of :kana_last_name, with: KATAKANA_REGEX, message: 'にはカタカナを設定してください'
  KATAKANA_REGEX = /\A([ァ-ン]|ー)+\z/.freeze
  validates_format_of :kana_first_name, with: KATAKANA_REGEX, message: 'にはカタカナを設定してください'

  has_many :sells
end
