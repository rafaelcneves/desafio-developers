require 'test_helper'

class CandidateTest < ActionController::TestCase
  test "should create" do
    @candidate = Candidate.new({name: "Testing case", email: "test@example.com"})
    assert @candidate.save
  end

  test "should not create without email or name" do
    @candidate = Candidate.new
    assert_not @candidate.save
  end

  test "should not create with invalid email" do
    @candidate = Candidate.new({name: "Testing case", email: "test"})
    assert_not @candidate.save
  end

  test "should test front-end candidates" do
    @candidate = candidates(:one)
    assert_equal false, @candidate.front_end?
    @candidate.html_score = 7
    @candidate.css_score = 7
    @candidate.javascript_score = 7
    assert_equal true, @candidate.front_end?
  end

  test "should test back-end candidates" do
    @candidate = candidates(:one)
    assert_equal false, @candidate.back_end?
    @candidate.django_score = 7
    @candidate.python_score = 7
    assert_equal true, @candidate.back_end?
  end

  test "should test mobile candidates" do
    @candidate = candidates(:one)
    assert_equal false, @candidate.mobile?
    @candidate.ios_score = 7
    @candidate.android_score = 7
    assert_equal true, @candidate.mobile?
  end

end
