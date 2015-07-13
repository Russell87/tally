require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select "title", "Tally | Home"
    assert_select "h1", "Tally"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "Tally | About"
    assert_select "h1", "About"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Tally | Contact"
    assert_select "h1", "Contact"
  end
  
end
