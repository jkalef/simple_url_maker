class UserUrl < ApplicationRecord
  validates :long_url, presence: true, format: URI::regexp(%w[http https])
  validates :short_url, presence: true

  has_many :url_statistics, dependent: :destroy

  scope :all_urls, -> {
    all.order(created_at: :desc)
  }

  def make_short_url
    "http://chitch.at/#{SecureRandom.alphanumeric}"
  end
end