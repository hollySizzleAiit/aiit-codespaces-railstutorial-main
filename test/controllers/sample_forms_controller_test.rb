require "test_helper"

class SampleFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sample_form = sample_forms(:one)
  end

  test "should get index" do
    get sample_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_sample_form_url
    assert_response :success
  end

  test "should create sample_form" do
    assert_difference("SampleForm.count") do
      post sample_forms_url, params: { sample_form: { checkbox: @sample_form.checkbox, color: @sample_form.color, date: @sample_form.date, datetime_local: @sample_form.datetime_local, email: @sample_form.email, file: @sample_form.file, hidden: @sample_form.hidden, month: @sample_form.month, number: @sample_form.number, password: @sample_form.password, radio: @sample_form.radio, range: @sample_form.range, search: @sample_form.search, tel: @sample_form.tel, text: @sample_form.text, time: @sample_form.time, url: @sample_form.url, week: @sample_form.week } }
    end

    assert_redirected_to sample_form_url(SampleForm.last)
  end

  test "should show sample_form" do
    get sample_form_url(@sample_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_sample_form_url(@sample_form)
    assert_response :success
  end

  test "should update sample_form" do
    patch sample_form_url(@sample_form), params: { sample_form: { checkbox: @sample_form.checkbox, color: @sample_form.color, date: @sample_form.date, datetime_local: @sample_form.datetime_local, email: @sample_form.email, file: @sample_form.file, hidden: @sample_form.hidden, month: @sample_form.month, number: @sample_form.number, password: @sample_form.password, radio: @sample_form.radio, range: @sample_form.range, search: @sample_form.search, tel: @sample_form.tel, text: @sample_form.text, time: @sample_form.time, url: @sample_form.url, week: @sample_form.week } }
    assert_redirected_to sample_form_url(@sample_form)
  end

  test "should destroy sample_form" do
    assert_difference("SampleForm.count", -1) do
      delete sample_form_url(@sample_form)
    end

    assert_redirected_to sample_forms_url
  end
end
