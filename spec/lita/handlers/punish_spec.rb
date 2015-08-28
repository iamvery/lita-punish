require "spec_helper"

describe Lita::Handlers::Punish, lita_handler: true do
  it { is_expected.to route(":wave:").to(:punish) }
  it { is_expected.not_to route("TIL stuff").to(:punish) }
  it { is_expected.not_to route("til things").to(:punish) }

  describe "#punish" do
    context "message from #today-i-learned" do
      it "replies with snark" do
        send_message("lolwat", from: "#today-i-learned")

        expect(described_class::SNARK).to include(replies.last)
      end
    end
  end
end
