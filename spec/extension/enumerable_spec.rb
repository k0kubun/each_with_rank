require 'spec_helper'

describe Enumerable do
  describe '#each_with_rank' do
    context 'given no args' do
      context 'when all numbers differ' do
        let(:array) { [100, 200, 300] }

        it 'yields [number, index + 1]' do
          expect { |block|
            array.each_with_rank(&block)
          }.to yield_successive_args([100, 1], [200, 2], [300, 3])
        end
      end

      context 'when some numbers are the same' do
        let(:array) { [100, 100, 300] }

        it 'the rank of the same numbers are the same' do
          expect { |block|
            array.each_with_rank(&block)
          }.to yield_successive_args([100, 1], [100, 1], [300, 3])
        end
      end
    end
  end

  describe '#each_with_rank_by' do
    context 'given symbol' do
      class Something
        def initialize(arg)
          @variable = arg
        end

        def method
          @variable
        end
      end

      let(:object1) { Something.new(100) }
      let(:object2) { Something.new(100) }
      let(:object3) { Something.new(300) }
      let(:array) { [object1, object2, object3] }

      it 'use numbers which object returns for the symbol' do
        object_rank_array = []
        array.each_with_rank_by(:method) do |something, rank|
          object_rank_array << [something, rank]
        end
        object_rank_array.should eq([[object1, 1], [object2, 1], [object3, 3]])
      end
    end
  end
end
