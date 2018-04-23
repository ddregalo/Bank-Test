# frozen_string_literal: true

require 'statement'

describe 'Statement' do
  let(:subject) { Statement.new }
  context 'Starts with no transactions' do
    it 'transaction_history attribute should be empty array' do
      expect(subject.transaction_history).to eq([])
    end
  end
end
