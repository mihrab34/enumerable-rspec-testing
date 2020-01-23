require './lib/enumerable'

RSpec.describe "Enumerable" do
    let(:arr) { [] }

    describe "#my_each" do
        it "returns elements of an array if block is given" do
            [1, 2, 3, 4].my_each{ |num| arr << num * 2  }
            expect(arr).to  eql([2, 4, 6, 8])
        end

        it "returns enumerator if no block is given" do
            expect([1, 2, 3].my_each).to  be_a(Enumerator)
        end
    end

    describe "#my_each_with_index" do
        it "returns the index of the elements of an array" do
            [1, 2, 3, 4].my_each_with_index{|elem, idx| arr << idx }
            expect(arr).to  eql([0, 1, 2, 3])
        end

        it "returns the elements of an array if block given" do
            [1, 2, 3, 4].my_each_with_index{|elem, idx| arr << elem }
            expect(arr).to  eql([1, 2, 3, 4])
        end

        it "returns enumerator if no block is given" do
            expect([1, 2, 3].my_each_with_index).to  be_a(Enumerator)
        end
    end

    describe "#my_select" do
        it "returns elements of an array if block condition is passed " do
            expect([2, 'ant', 3, 'boat', 4, 'cat'].my_select { |item| item.class == String }).to  eql(%w[ant boat cat])
        end
        
    end
    
    

end
