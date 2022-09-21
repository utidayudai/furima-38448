class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #validstes :nickname,presence: true
  #validstes :last_name,presence: true
  #validstes :first_name,presence: true
  #validstes :kana_last_name,presence: true
  #validstes :kana_first_name,presence: true
  #validstes :birthday,presence: true
end
