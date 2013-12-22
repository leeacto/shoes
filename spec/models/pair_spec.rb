require 'spec_helper'

describe Pair do
	describe 'validations' do
		before(:each) do 
			@attr = {
				brand: 'Nike',
				nickname: 'YOTS',
				year: 2012,
				model: 'Air Force 1',
				condition: 9,
				description: 'cool shoes here',
				user_id: 1
			}
		end

		it 'must have a brand' do
			pair = Pair.new(@attr)
			pair.brand = nil
			expect{pair.save}.not_to change(Pair, :count)
		end

		describe 'condition' do
			it 'rejects the correct range' do
				@pair = FactoryGirl.create(:pair)
				@pair.condition = 11
				@pair.save
				expect(@pair.condition).to eq 9
			end

			it 'accepts the correct range' do
				@pair = FactoryGirl.create(:pair)
				@pair.condition = 8
				@pair.save
				expect(@pair.condition).to eq 8
			end
		end
	end
end
