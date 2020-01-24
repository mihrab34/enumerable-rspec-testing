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

        it "returns enumerator if no block is given" do
            expect([1, 2, 3].my_select).to  be_a(Enumerator)
        end 
    end

    describe "#my_all?" do
        it "returns true if the block never return false or nil" do
            expect(%w[ant, bat, cat, mat ].my_all? { |item| item.size >= 3 }).to  eql(true)
        end

        it "returns true if no block given" do
            expect(%w[ant, bat, cat, mat ].my_all?).to  eql(true)
        end
    end

    describe "#my_any?" do
        it "returns true if the block ever return a value other than false or nil" do
            expect(%w[ant, bat, cat, matter, mouse, sit ].my_any? { |item| item.size <= 3 }).to  eql(true)
        end

        it "returns true if no block given" do
            expect(%w[ant, bat, cat, matter, mouse, sit ].my_any?).to  eql(true)
        end
    end
    
    describe "#my_none?" do
        it "returns true if the block never returns true for all the elements of the array " do
            expect([2, 4, 6, 8, 10].my_none?(&:odd?)).to  eql(true)
        end

        it "returns true if none of the array elements are true and no block given" do
            expect([2, 4, 6, 8, 10].my_none?(&:even?)).to  eql(false)
        end
    end

    describe "#my_count" do
        it "returns the number of element yielding a true value" do
            expect([1, 2, 3, 4, 5, 8].my_count(&:odd?)).to  eql(3)
        end
        
        it "returns the number of occurence of the argument given in array" do
            expect([1, 2, 3, 1, 1, 5, 4, 1].my_count(1)).to  eql(4)  
        end
        
        it "returns the number of elements of an array" do
            expect([1, 2, 3, 4, 5, 8].my_count).to  eql(6)
        end
        

    end
    
    

end
