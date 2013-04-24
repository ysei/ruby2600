require 'ruby_atari'

RSpec.configure do |c|
  c.alias_it_should_behave_like_to :it_has_behavior, 'has behavior:'
end

shared_examples_for 'reads_from_correct_chip' do |range, chip|
  it "reads addresses #{range} using #{chip}" do
    range.each do |address|
      value = Random.rand(256)
      send(chip).stub(:read).with(address).and_return(value)

      subject.read(address).should == value
    end
  end
end

shared_examples_for 'writes_to_correct_chip' do |range, chip|
  it "writes addresses #{range} using #{chip}" do
    range.each do |address|
      value = Random.rand(256)
      send(chip).should_receive(:write).with address, value

      subject.write address, value
    end
  end
end

