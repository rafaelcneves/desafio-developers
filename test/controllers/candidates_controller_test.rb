require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  setup do
    @candidate = candidates(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidate" do
    assert_difference('Candidate.count') do
      post :create, candidate: { android_score: @candidate.android_score, css_score: @candidate.css_score, django_score: @candidate.django_score, email: @candidate.email, html_score: @candidate.html_score, ios_score: @candidate.ios_score, javascript_score: @candidate.javascript_score, name: @candidate.name, python_score: @candidate.python_score }
    end

    assert_redirected_to candidate_path(assigns(:candidate))
  end

  test "should show candidate" do
    get :show, id: @candidate
    assert_response :success
  end

end
