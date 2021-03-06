class Event < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :categories
  has_many :photos, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :guests, through: :registrations, dependent: :destroy, source: :user

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :price, presence: true

  #validates :starts_at, presence: true
  #validates :ends_at, presence: true



  def bargain?
    price < 30
  end

  def free?
    price==0
  end

  scope :published?, -> { where(active: true) }


  def self.order_by_name
    order(name: :asc)
  end

  def self.order_by_price
    order(:price)
  end


  def self.starts_before_ends_after(date)
    where('starts_at < ? AND ends_at > ?', date)
  end

  def self.equals_start (date)
    where('starts_at: ?', date)
  end


  def self.equals_end (date)
    where('ends_at: ?', date)
  end

end
