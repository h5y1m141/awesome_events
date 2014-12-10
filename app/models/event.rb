# -*- coding: utf-8 -*-
class Event < ActiveRecord::Base
  mount_uploader :event_image, EventImageUploader
  has_many :tickets, dependent: :destroy
  belongs_to :owner, class_name: 'User'
  validates :name       , length: { maximum: 50 }, presence: true
  validates :place      , length: { maximum: 100}, presence: true
  validates :content    , length: {maximum: 2000}, presence: true
  validates :start_time , presence: true
  validates :end_time   , presence: true
  validate  :start_time_should_be_before_and_time
  validate  :check_image_dimensions
  

  def created_by?(user)
    return false unless user
    owner_id == user.id
  end
  
  private

  def start_time_should_be_before_and_time
    return unless start_time && end_time
    
    if start_time >= end_time
      errors.add(:start_time, 'は終了時間よりも前に設定してください')
    end
  end
  
  def check_image_dimensions
    ::Rails.logger.info "Image upload dimensions: #{event_image.geometry[:width]}x#{event_image.geometry[:height]}"
    errors.add :event_image, '400x400ピクセル以上のサイズの画像をアップロードしてください' if event_image.geometry[:width] < 400 || event_image.geometry[:height] < 400    
  end
end
