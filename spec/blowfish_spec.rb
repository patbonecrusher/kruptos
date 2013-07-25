require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Kruptos
  describe Blowfish do
    # -------------------------------------------------------------------------
    # -------------------------------------------------------------------------
    describe "#initialize" do

      TMP_PATH = "/tmp/"
      BAD_PATH = "/adsdsadasdsa"
      TEST_REPO_PATH = "/tmp/test_git"
      TEST_REPO_PATH_BARE = "/tmp/test_git_bare"
    
      before(:each) do
        @bf = Kruptos::Blowfish.new("Who is John Galt?")  # Schneier's test key
      end

      it "will validate the blocksize is 8 no matter what" do
        @bf.block_size().should eq 8
      end

      it "will validate a runtime error gets raised on creation with no args" do
        lambda{Kruptos::Blowfish.new("")}.should raise_error(RuntimeError)
      end

      it "will validate no error gets raised on new with smallest key size" do
        lambda{Kruptos::Blowfish.new("1")}.should_not raise_error
      end

      it "will validate no error gets raised on new with biggest key size" do
        lambda{Kruptos::Blowfish.new("1"*56)}.should_not raise_error
      end

      it "will validate a runtime error gets raised on new with a key to long" do
        lambda{Kruptos::Blowfish.new("1"*57)}.should raise_error(RuntimeError)
      end

    end
  end
end
