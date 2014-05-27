require_relative '../merge_sort'

describe MergeSort do

  describe "#split" do
    context "there's an even number of elements greater than 2" do
      it "should split an array in half" do
        input = [:one, :two, :three, :four, :five, :six]
        input1, input2 = MergeSort.send(:split, input)
        input1.should eq input[0..2]
        input2.should eq input[3..5]
      end
    end

    context "there's an odd number of elements greater than 2" do
      it "should return a smaller first array and larger second array" do
        input = [:one, :two, :three, :four, :five]
        input1, input2 = MergeSort.send(:split, input)
        input1.should eq input[0..1]
        input2.should eq input[2..4]
      end
    end

    context "there's only one element in the array" do
      it "should return the array with one element" do
        input = [:one]
        input1, input2 = MergeSort.send(:split, input)
        input1.should eq input
        input2.should be_nil
      end
    end
  end

  describe "#merge" do
    context "there's a single element in the left and right arrays" do
      it "should merge and sort properly when left is greater than right" do
        left, right = [5], [2]
        merged = MergeSort.send(:merge, left, right)
        merged.should eq [2,5]
      end
    end

    context "there's multiple & equal elements in the left & right arrays" do
      it "should merge and sort properly when left is greater than right" do
        left, right = [5,7,9], [2,3,6]
        merged = MergeSort.send(:merge, left, right)
        merged.should eq [2,3,5,6,7,9]
      end
    end

    context "there's multiple & unequal lements in the left & right arrays" do
      it "should merge and sort properly when left is greater than right" do
        left, right = [5,7,9], [2,3,6,8]
        merged = MergeSort.send(:merge, left, right)
        merged.should eq [2,3,5,6,7,8,9]
      end
    end
  end

  describe "#sort" do
    context "there are two elements" do
      it "should return a sorted array" do
        input = [5,1]
        output = MergeSort.sort(input)
        output.should eq [1,5]
      end
    end

    context "there's an even number of elements" do
      it "should return a sorted array" do
        input = [5,1,9,3,2,6,4,7]
        output = MergeSort.sort(input)
        output.should eq [1,2,3,4,5,6,7,9]
      end
    end

    context "there's an odd number of elements" do
      it "should return a sorted array" do
        input = [5,1,9,3,2,6,4]
        output = MergeSort.sort(input)
        output.should eq [1,2,3,4,5,6,9]
      end
    end
  end

end