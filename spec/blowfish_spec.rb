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
      end

      it "will raise a runtime error on creation with no args" do
        lambda{Kruptos::Blowfish.new("")}.should raise_error(RuntimeError)
      end

      it "will not raise any error on creation with smallest key size" do
        lambda{Kruptos::Blowfish.new("1")}.should_not raise_error
      end

      it "will not raise any error oncreation with biggest key size" do
        lambda{Kruptos::Blowfish.new("1"*56)}.should_not raise_error
      end

      it "will raise a runtime on creation with a key to big" do
        lambda{Kruptos::Blowfish.new("1"*57)}.should raise_error(RuntimeError)
      end

      it "will validate the blocksize is 8 no matter what" do
        bf = Kruptos::Blowfish.new("Who is John Galt?")  # Schneier's test key
        bf.block_size().should eq 8
      end

      it "will encrypt a pair" do
        bf = Kruptos::Blowfish.new("Who is John Galt?")  # Schneier's test key
        orig_l, orig_r = [0xfedcba98, 0x76543210] 
        l, r = bf.encrypt_pair(orig_l, orig_r)
        l.should eq 0xcc91732b
        r.should eq 0x8022f684
      end

      it "will decrypt a pair" do
        bf = Kruptos::Blowfish.new("Who is John Galt?")  # Schneier's test key
        encrypted_l, encrypted_r = [0xfedcba98, 0x76543210] 
        encrypted_l, encrypted_r = [0xcc91732b, 0x8022f684] 
        l, r = bf.decrypt_pair(encrypted_l, encrypted_r)
        l.should eq 0xfedcba98
        r.should eq 0x76543210
      end

      it "will encrypt a block" do
      end      

      it "will decrypt a block" do
      end      

      it "will encrypt a string" do
      end      

      it "will decrypt a string" do
      end      

      it "will encrypt a file" do
      end      

      it "will decrypt a file" do
      end      

    end
  end
end
