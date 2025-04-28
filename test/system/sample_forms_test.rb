require "application_system_test_case"

class SampleFormsTest < ApplicationSystemTestCase
  setup do
    @sample_form = sample_forms(:one)
  end

  test "visiting the index" do
    visit sample_forms_url
    assert_selector "h1", text: "Sample forms"
  end

  test "should create sample form" do
    visit sample_forms_url
    click_on "New sample form"

    check "Checkbox" if @sample_form.checkbox
    fill_in "Color", with: @sample_form.color
    fill_in "Date", with: @sample_form.date
    fill_in "Datetime local", with: @sample_form.datetime_local
    fill_in "Email", with: @sample_form.email
    fill_in "File", with: @sample_form.file
    fill_in "Hidden", with: @sample_form.hidden
    fill_in "Month", with: @sample_form.month
    fill_in "Number", with: @sample_form.number
    fill_in "Password", with: @sample_form.password
    fill_in "Radio", with: @sample_form.radio
    fill_in "Range", with: @sample_form.range
    fill_in "Search", with: @sample_form.search
    fill_in "Tel", with: @sample_form.tel
    fill_in "Text", with: @sample_form.text
    fill_in "Time", with: @sample_form.time
    fill_in "Url", with: @sample_form.url
    fill_in "Week", with: @sample_form.week
    click_on "Create Sample form"

    assert_text "Sample form was successfully created"
    click_on "Back"
  end

  test "should update Sample form" do
    visit sample_form_url(@sample_form)
    click_on "Edit this sample form", match: :first

    check "Checkbox" if @sample_form.checkbox
    fill_in "Color", with: @sample_form.color
    fill_in "Date", with: @sample_form.date
    fill_in "Datetime local", with: @sample_form.datetime_local
    fill_in "Email", with: @sample_form.email
    fill_in "File", with: @sample_form.file
    fill_in "Hidden", with: @sample_form.hidden
    fill_in "Month", with: @sample_form.month
    fill_in "Number", with: @sample_form.number
    fill_in "Password", with: @sample_form.password
    fill_in "Radio", with: @sample_form.radio
    fill_in "Range", with: @sample_form.range
    fill_in "Search", with: @sample_form.search
    fill_in "Tel", with: @sample_form.tel
    fill_in "Text", with: @sample_form.text
    fill_in "Time", with: @sample_form.time
    fill_in "Url", with: @sample_form.url
    fill_in "Week", with: @sample_form.week
    click_on "Update Sample form"

    assert_text "Sample form was successfully updated"
    click_on "Back"
  end

  test "should destroy Sample form" do
    visit sample_form_url(@sample_form)
    click_on "Destroy this sample form", match: :first

    assert_text "Sample form was successfully destroyed"
  end
end
