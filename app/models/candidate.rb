class Candidate < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :html_score, :css_score, :javascript_score, :python_score, :django_score, :ios_score, :android_score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }, allow_nil: true

  def front_end?
    html_score.to_i >= 7 && css_score.to_i >= 7 && javascript_score.to_i >=7
  end

  def back_end?
    python_score.to_i >= 7 && django_score.to_i >= 7
  end

  def mobile?
    ios_score.to_i >= 7 || android_score.to_i >= 7
  end
end
