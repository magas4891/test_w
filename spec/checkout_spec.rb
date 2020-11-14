# frozen_string_literal: true

require_relative '../lib/checkout'
require_relative '../lib/rule'

RSpec.describe Checkout do
  subject { described_class.new(rules) }
  let(:item_a) { {name: 'A', price: 30} }
  let(:item_b) { {name: 'B', price: 50} }

  describe 'without rules' do
    let(:rules) { [] }

    context "#initialize" do
      it { is_expected.to have_attributes(basket: [],
                                          rules: [],
                                          total_price: 0) }
    end

    context 'when one item is scanned' do
      before do
        subject.scan(item_a)
      end
      it 'adds the item to the basket and adds to the total_price' do
        expect(subject.basket).to eq([item_a])
        expect(subject.total_price).to eq(30)
      end
    end

    context 'when multiple items are scanned' do
      before do
        [item_a, item_b].each { |item| subject.scan(item) }
      end
      it 'adds items to the basket and adds to the total_price' do
        expect(subject.basket).to eq([item_a, item_b])
        expect(subject.total_price).to eq(80)
      end
    end
  end

  describe 'with existing rules' do
    let(:rules) { [
        {
            item: 'A',
            quantity: 3,
            total_price: 75
        },
        {
            basket_total: 150,
            discount: 20
        }
    ] }
    context "#initialize" do
      it { is_expected.to have_attributes(basket: [],
                                          rules: rules,
                                          total_price: 0) }
    end

    context 'when multi-price rule is apply' do
      before do
        3.times { subject.scan(item_a) }
        subject.total
      end
      it 'adds the item to the basket and applyes the rule' do
        expect(subject.basket).to eq([item_a, item_a, item_a])
        expect(subject.total_price).to eq(75)
      end
    end

    context 'when basket-total-price rule is apply' do
      before do
        3.times { subject.scan(item_b) }
        subject.total
      end
      it 'adds the item to the basket and applyes the rule' do
        expect(subject.basket).to eq([item_b, item_b, item_b])
        expect(subject.total_price).to eq(130)
      end
    end
  end
end
