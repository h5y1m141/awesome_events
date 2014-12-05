# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :event do
    owner
    sequence(:name) { |i| "イベント名#{i}"}
    sequence(:place) { |i| "場所#{i}"}
    sequence(:content) { |i| "内容#{i}"}
    start_time { rand(1..30).days.from_now }
    end_time {start_time + rand(1..30).hours }
  end
end
