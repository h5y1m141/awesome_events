require 'rails_helper'

describe Event do
  describe '#name' do
    context 'blank' do
      it 'not valid' do
        event = Event.new(name: '')
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end
  end
end
