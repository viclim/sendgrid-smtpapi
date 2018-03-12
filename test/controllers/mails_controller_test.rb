require 'test_helper'

class MailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mail = mails(:one)
  end

  test "should get index" do
    get mails_url
    assert_response :success
  end

  test "should get new" do
    get new_mail_url
    assert_response :success
  end

  test "should create mail" do
    assert_difference('Mail.count') do
      post mails_url, params: { mail: { content: @mail.content, from: @mail.from, subject: @mail.subject, to: @mail.to } }
    end

    assert_redirected_to mail_url(Mail.last)
  end

  test "should show mail" do
    get mail_url(@mail)
    assert_response :success
  end

  test "should get edit" do
    get edit_mail_url(@mail)
    assert_response :success
  end

  test "should update mail" do
    patch mail_url(@mail), params: { mail: { content: @mail.content, from: @mail.from, subject: @mail.subject, to: @mail.to } }
    assert_redirected_to mail_url(@mail)
  end

  test "should destroy mail" do
    assert_difference('Mail.count', -1) do
      delete mail_url(@mail)
    end

    assert_redirected_to mails_url
  end
end
