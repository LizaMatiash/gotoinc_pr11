class Ticket < ApplicationRecord

  belongs_to :user, optional: true
  # belongs_to :train
  belongs_to :train, optional: true
  belongs_to :base_station, class_name: 'RailwayStation', foreign_key: :base_station_id, optional: true
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id, optional: true

  after_create :send_notification
  after_destroy :send_delete_notification

  private

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_delete_notification
    TicketsMailer.delete_ticket(self.user, self).deliver_now
  end
end
