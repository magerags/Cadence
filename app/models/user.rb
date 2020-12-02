class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :user_setting, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :goals
  has_many :categories

  after_create :assign_default_categories

  def assign_default_categories
    Category::DEFAULT_CATEGORIES.each do |cat|
      Category.create!(name: cat, user: self)
    end
  end
end
