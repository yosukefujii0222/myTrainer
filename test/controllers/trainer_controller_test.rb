require 'test_helper'

class TrainerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get trainer_new_url
    assert_response :success
  end

end
