require './lib/enumerable'

RSpec.describe "Enumerable" do
    let(:arr) { [] }
    describe "my_each" do
        it "returns the element in an array if block is given" do
            expect([1, 2, 3].my_each{ |num| num }).to  eq([1, 2, 3])
        end

        it "returns enumerator if no block is given" do
            expect([1, 2, 3].my_each).to  be_a(Enumerator)
        end
    end
    
end
