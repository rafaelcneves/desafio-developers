class Candidate < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :html_score, :css_score, :javascript_score, :python_score, :django_score, :ios_score, :android_score, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10}, allow_nil: true
end
