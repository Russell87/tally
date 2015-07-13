require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select "title", "Tally | Home"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "Tally | About"
  end

end
