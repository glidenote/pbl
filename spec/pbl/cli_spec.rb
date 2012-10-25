# -*- coding: utf-8 -*-

require File.expand_path('../../spec_helper', __FILE__)

describe Pbl::CLI do
  before do
    @config = { username: "foo", password: "bar" }
    Pit.stub(:get).and_return(@config)
  end

  describe "#initialize" do
    subject { described_class.new }

    it { expect(subject).to be_an_instance_of(Pbl::CLI) }

    it "should invoked Pit.get" do
      Pit.should_receive(:get)
        .with(:pinboard, {:require=>{:username=>"your_account_in_pinboard", :password=>"your_password_in_pinboard"}})
        .and_return({username: "foo", password: "bar"})
      subject
    end

    it "should invoked Pinboard::Client.new" do
      Pit.stub(:get).and_return(@config)
      Pinboard::Client.should_receive(:new).with(@config)
      subject
    end

    it "should assign @pinboard" do
      Pit.stub(:get).and_return(@config)
      expect(subject.instance_eval { @pinboard }).to be_an_instance_of(Pinboard::Client)
    end
  end

  describe ".run" do
    subject { described_class.run }

    it "should invoked Pbl::Cli.new.run" do
      described_class.any_instance.should_receive(:run)
      subject
    end
  end

  describe "#run" do
    before do
      @subject = described_class.new
    end

    context "when ARGV is empty" do
      before do
        @subject.instance_variable_set(:@argv, [])
      end

      it "should raise SystemExit error" do
        expect {
          @subject.run
        }.to raise_error SystemExit
      end
    end

    context "when ARGV is not empty" do
      before do
        @subject.instance_variable_set(:@argv, ["ruby"])
      end

      it "should invoke $stdout.puts at least once" do
        VCR.use_cassette 'pinboard_requests' do
          $stdout.should_receive(:puts).at_least(:once)
          @subject.run
        end
      end
    end
  end
end
