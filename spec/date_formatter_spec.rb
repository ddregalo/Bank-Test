# frozen_string_literal: true

require 'date_formatter'

describe 'DateFormatter' do
  let(:subject) { DateFormatter.new }
  describe '#format_date' do
    it 'Returns the current day in format dd/mm/yyyy' do
      allow(Time).to receive(:now).and_return('2018-04-23 15:00:00 +0100')
      expect(subject.format_date).to eq('23/04/2018')
    end
  end
end
