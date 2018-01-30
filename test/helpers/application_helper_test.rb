require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "should return a bootstrap class" do
    assert_equal "alert-success", bootstrap_class_for("success")
    assert_equal "alert-error", bootstrap_class_for("error")
    assert_equal "alert-warning", bootstrap_class_for("alert")
    assert_equal "alert-info", bootstrap_class_for("notice")
    assert_equal "blabla", bootstrap_class_for("blabla")
  end
end
