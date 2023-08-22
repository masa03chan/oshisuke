class Batch::RemindEvent
  def self.remind_event
    # Event.reload
    events = Event.all
    events.each do |event|
      time_difference = (event.start_at - Time.now.in_time_zone("Tokyo")) / 3600 # AM9:00との時間差を時間単位で算出する
      if time_difference <= 39 && time_difference >= 15  && event.end_user.email_receiving_activation == true # 次の日のスケジュールなのかユーザーがリマインド機能をオンにしているかを判定
        RemindEventMailer.creation_email(event).deliver_now # メールを送信するためのメソッド
        p "メールを#{event.end_user.name}に送信しました" # ログに表示するメッセージ
      end
    end
  end
end