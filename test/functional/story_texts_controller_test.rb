require 'test_helper'

class StoryTextsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:story_texts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create story_text" do
    assert_difference('StoryText.count') do
      post :create, :story_text => { }
    end

    assert_redirected_to story_text_path(assigns(:story_text))
  end

  test "should show story_text" do
    get :show, :id => story_texts(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => story_texts(:one).id
    assert_response :success
  end

  test "should update story_text" do
    put :update, :id => story_texts(:one).id, :story_text => { }
    assert_redirected_to story_text_path(assigns(:story_text))
  end

  test "should destroy story_text" do
    assert_difference('StoryText.count', -1) do
      delete :destroy, :id => story_texts(:one).id
    end

    assert_redirected_to story_texts_path
  end
end
