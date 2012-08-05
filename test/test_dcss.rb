require 'helper'

describe Dcss::Doc do

  describe "when user submit doc directory path" do
    it "must be read all DCSS files within direcotyr" do 
      doc = Dcss::Doc.new("#{File.dirname(__FILE__)}/test_docs/css")
      assert_kind_of Dcss::Doc, doc
    end
  end

  describe "When user submit doc directory path" do 
    it "must read all references tags selected file" do
      doc = Dcss::Doc.new("#{File.dirname(__FILE__)}/test_docs/css")
      section  = doc.section('buttons')
      assert_kind_of Dcss::Section, section
    end
  end

  describe "When system process a specific scss file" do 
    it "must return description" do 
      doc = Dcss::Doc.new("#{File.dirname(__FILE__)}/test_docs/css")
      description = doc.section('buttons').description
      assert description
    end
  end

  describe "When system process a specific scss file" do 
    it "must return modifiers array of object" do 
      doc = Dcss::Doc.new("#{File.dirname(__FILE__)}/test_docs/css")
      modifiers = doc.section('buttons').modifiers
      assert_kind_of Dcss::Modifier, modifiers.first
    end
  end

  describe "When system process a specific scss file" do
    it "must return experimental valu" do
      doc = Dcss::Doc.new("#{File.dirname(__FILE__)}/test_docs/css")
      experimental = doc.section('buttons').experimental
      assert experimental
    end
  end

  describe "When system process a specific scss file" do 
    it "must return deprecated value" do
      doc = Dcss::Doc.new("#{File.dirname(__FILE__)}/test_docs/css")
      deprecated = doc.section('buttons').deprecated
      assert deprecated
    end
  end

  describe "When system process a specific scss file" do 
    it "must return compatible value" do 
      doc = Dcss::Doc.new("#{File.dirname(__FILE__)}/test_docs/css")
      compatible = doc.section('buttons').compatible
      assert compatible
    end
  end

  describe "When system process a specific scss file" do 
    it "must return version nubmer" do 
      doc = Dcss::Doc.new("#{File.dirname(__FILE__)}/test_docs/css")
      version = doc.section('buttons').version
      assert version
    end
  end
end
