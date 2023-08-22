class RemindEventMailer < ApplicationMailer
  def creation_email(event)
    @event = event # メールのテンプレを作成するときに使用します
    mail(
      subject: "【Converce】イベントリマインダー", # メールの件名
      to: event.end_user.email,                # メールの宛先
    )
  end
end
