require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
  
  test "signup page" do
    get users_new_path
    assert_response :success
    assert_template "users/new"
    assert_select "title", "Sign Up | Ruby on Rails Tutorial Sample App"
  end
end