require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  setup do
    @candidate = candidates(:one)
    ActionMailer::Base.deliveries = []
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidate" do
    assert_difference('Candidate.count') do
      post :create, candidate: { android_score: @candidate.android_score, css_score: @candidate.css_score, django_score: @candidate.django_score, email: @candidate.email, html_score: @candidate.html_score, ios_score: @candidate.ios_score, javascript_score: @candidate.javascript_score, name: @candidate.name, python_score: @candidate.python_score }
    end

    assert_not_nil(:candidate)
    assert_not ActionMailer::Base.deliveries.empty?
    assert_redirected_to candidate_path(assigns(:candidate))
  end

  test "should show candidate" do
    get :show, id: @candidate
    assert_not_nil(:candidate)
    assert_response :success
  end

  test "should send only generic email" do
    post :create, candidate: { email: @candidate.email, name: @candidate.name, android_score: 1, css_score: 1, django_score: 1, html_score: 1, ios_score: 1, javascript_score: 1, python_score: 1 }
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_equal [@candidate.email], ActionMailer::Base.deliveries.last.to
    assert_includes ActionMailer::Base.deliveries.last.body.to_s, I18n.t("mail.message.generic")
  end

  test "should send only front-end email" do
    post :create, candidate: { email: @candidate.email, name: @candidate.name, android_score: 1, css_score: 7, django_score: 1, html_score: 8, ios_score: 1, javascript_score: 9, python_score: 1 }
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_equal [@candidate.email], ActionMailer::Base.deliveries.last.to
    assert_includes ActionMailer::Base.deliveries.last.body.to_s, I18n.t("mail.message.front_end")
  end

  test "should send only back-end email" do
    post :create, candidate: { email: @candidate.email, name: @candidate.name, android_score: 1, css_score: 1, django_score: 7, html_score: 1, ios_score: 1, javascript_score: 1, python_score: 8 }
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_equal [@candidate.email], ActionMailer::Base.deliveries.last.to
    assert_includes ActionMailer::Base.deliveries.last.body.to_s, I18n.t("mail.message.back_end")
  end

  test "should send only ios mobile email" do
    post :create, candidate: { email: @candidate.email, name: @candidate.name, android_score: 1, css_score: 1, django_score: 1, html_score: 1, ios_score: 7, javascript_score: 1, python_score: 1 }
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_equal [@candidate.email], ActionMailer::Base.deliveries.last.to
    assert_includes ActionMailer::Base.deliveries.last.body.to_s, I18n.t("mail.message.mobile")
  end

  test "should send only android mobile email" do
    post :create, candidate: { email: @candidate.email, name: @candidate.name, android_score: 7, css_score: 1, django_score: 1, html_score: 1, ios_score: 1, javascript_score: 1, python_score: 1 }
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_equal [@candidate.email], ActionMailer::Base.deliveries.last.to
    assert_includes ActionMailer::Base.deliveries.last.body.to_s, I18n.t("mail.message.mobile")
  end

  test "should send all possible email" do
    post :create, candidate: { email: @candidate.email, name: @candidate.name, android_score: 7, css_score: 7, django_score: 7, html_score: 7, ios_score: 7, javascript_score: 7, python_score: 7 }
    assert_equal 3, ActionMailer::Base.deliveries.size
    assert_equal [@candidate.email], ActionMailer::Base.deliveries.last.to
  end

end
