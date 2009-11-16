require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

module Auto
  describe Auto::Terminal do
    
    before(:each) do
      @r = Runner.new
    end
    
    it 'should expose a terminal method' do
      @r.run do
        self.class.instance_methods.include?('terminal').should == true
      end
    end
  end
end