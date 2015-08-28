module Lita
  module Handlers
    class Punish < Handler
      SNARK = [
        "*ahem*",
        "rly?",
        "SHH",
        "ಠ_ಠ",
      ]

      route /^(?!TIL)/i, :punish

      def punish(response)
        if response.message.source.room == "#today-i-learned"
          response.reply SNARK.sample
        end
      end

      Lita.register_handler(self)
    end
  end
end
